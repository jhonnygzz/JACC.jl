using CUDA
import JACC
using Test

@testset "TestBackend" begin
    @test JACC.JACCPreferences.backend == "cuda"
end

@testset "zeros_type" begin
    N = 10
    x = JACC.zeros(Float64, N)
    @test typeof(x) == CUDA.CuArray{Float64, 1, CUDA.DeviceMemory}
    @test eltype(x) == Float64
end

@testset "ones_type" begin
    N = 10
    x = JACC.ones(Float64, N)
    @test typeof(x) == CUDA.CuArray{Float64, 1, CUDA.DeviceMemory}
    @test eltype(x) == Float64
end

# @testset VectorAddLoop begin
#     N = 1024
#     A = JACC.Array{Float32}(1, N)
#     B = JACC.Array{Float32}(1, N)

#     @jacc
#     for i in 1:N
#         C[i] = A[i] + B[i]
#     end
# end

# @testset VectorReduce begin
#     N = 1024
#     A = JACC.Array{Float32}(1, N)
#     B = JACC.Array{Float32}(1, N)

#     @jacc reduction(C)
#     for i in 1:N
#         C += A[i] * B[i]
#     end
# end

# @testset VectorAddLoopKernel begin
#     N = 1024
#     A = JACC.Array{Float32}(1, N)
#     B = JACC.Array{Float32}(1, N)

#     function kernel(i, A, B)

#     end

#     @jacc
#     for i in 1:N
#         C[i] = A[i] + B[i]
#     end
# end


#@testset "JACC.multi" begin

#    x = ones(1_000)
#    y = ones(1_000)
#    jx = JACC.multi.Array(x)
#    jy = JACC.multi.Array(y)
#    jxresult = ones(1_000)
#    alpha = 2.0

#    function seq_axpy(N, alpha, x, y)
#        for i in 1:N
#            @inbounds x[i] += alpha * y[i]
#        end
#    end
    
#    function multi_axpy(dev_id, i, alpha, x, y)
#	    @inbounds x[dev_id][i] += alpha * y[dev_id][i]
#    end
    
#    function seq_dot(N, x, y)
#        r = 0.0
#        for i in 1:N
#            @inbounds r += x[i] * y[i]
#        end
#        return r
#    end

#    function multi_dot(dev_id, i, x, y)
#        @inbounds x[dev_id][i] * y[dev_id][i]
#    end

    #ref_result = seq_axpy(1_000, x, y)
    #jresult = JACC.multi.parallel_reduce(1_000, multi_dot, jx[1], jy[1])
#    seq_axpy(1_000, alpha, x, y)
#    JACC.multi.parallel_for(1_000, multi_axpy, alpha, jx[1], jy[1])

    #result = Base.Array(jresult)

    #@test jresult[1]≈ref_result rtol=1e-8
#end
