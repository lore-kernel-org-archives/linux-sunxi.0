Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E74315E5C9
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Apr 2024 14:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713968531; cv=none; b=X0/cXXvOB+3zbQ9aOT0m69bjHVgRiK38lmguFiWNJ3VHaxPzybJY4kmI3C9cuzrzMHMb3Ztb0d6q+ReugQM2zbM7Q/fQVJuUXEtklVvptFYj6YovKli51bZNLBfw9+MgKMNC38H2AsWETguf1y/nND8Gu0Z+OltsH2o5pX3OCyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713968531; c=relaxed/simple;
	bh=bKd7H00rDt0Or6kdVYu+lE7iFOzMdHEuVtRzVbC9rds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qVp0gxO5cukfsaETSVj9bp/HLxPWx6xTTRiNekhvnkw6q+XRwr4KXxpKvGo2TvOauISHboL28MC44pvIO6B2tfnw9/xRrP8Tj4aL2QQKnXFulIWm1NaPoJYFO6g9o/aDB+IM+H6GezT3H15cT0zTNfraj3VSXQvNHUP/72qtx/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2E576FF809;
	Wed, 24 Apr 2024 14:22:02 +0000 (UTC)
Message-ID: <6c624361-a968-498b-a9fb-ea2aaec70ce8@ghiti.fr>
Date: Wed, 24 Apr 2024 16:22:02 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/17] riscv: Fix extension subset checking
Content-Language: en-US
To: Charlie Jenkins <charlie@rivosinc.com>, Conor Dooley <conor@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
 <20240420-dev-charlie-support_thead_vector_6_9-v3-6-67cff4271d1d@rivosinc.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240420-dev-charlie-support_thead_vector_6_9-v3-6-67cff4271d1d@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: alex@ghiti.fr

Hi Charlie,

On 21/04/2024 03:04, Charlie Jenkins wrote:
> This loop is supposed to check if ext->subset_ext_ids[j] is valid, rather
> than if ext->subset_ext_ids[i] is valid, before setting the extension
> id ext->subset_ext_ids[j] in isainfo->isa.
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Fixes: 0d8295ed975b ("riscv: add ISA extension parsing for scalar crypto")
> ---
>   arch/riscv/kernel/cpufeature.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 48874aac4871..b537731cadef 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -609,7 +609,7 @@ static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
>   
>   			if (ext->subset_ext_size) {
>   				for (int j = 0; j < ext->subset_ext_size; j++) {
> -					if (riscv_isa_extension_check(ext->subset_ext_ids[i]))
> +					if (riscv_isa_extension_check(ext->subset_ext_ids[j]))
>   						set_bit(ext->subset_ext_ids[j], isainfo->isa);
>   				}
>   			}
>

I think this should go into -fixes, let's check with Palmer if he wants 
to take this patch only or if you should send the patch on its own.

You can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


