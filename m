Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F4216D327
	for <linux-sunxi@lists.linux.dev>; Mon,  1 Jul 2024 15:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719848968; cv=none; b=Dr7CisUfgol+erny5sCbHNubcLShCpiPmcLTkOxxgdJ1/Sxl9ldQC5DOinrug0JtNl1Mtn0YYYhypqiMlNbgHBO83pXyguEhknYV7T3lZS7Us3W4IRBzZo+/oooh38BsfpiTxgFzjptP0ztPdBG9X1cxFCYsXOBqX/5V+5rP6OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719848968; c=relaxed/simple;
	bh=7wpTDCYkfM0h9G8p58hcJdgXA+PbS7WdaAYXL72gy+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hu9yjz2xKbB1CGbMDAD2G9txIpiH7bUYOoO6IdoshZuqGoMTtiijbuR5ySNabLg93TL2GmBXZPLjLCqg0Bogxlk/u9cLRiXvhHwLNb3nlEfEcYS/C0eZW3E848lV1nepHlnvfGiczlCdAd5c/Ygz9MM9iE8y66TOhd6rcX0Eeoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=EoD+1Ina; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="EoD+1Ina"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6325b04c275so31901057b3.3
        for <linux-sunxi@lists.linux.dev>; Mon, 01 Jul 2024 08:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1719848965; x=1720453765; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=umkqtCJW3Dg9JtpfzIAAg1v5vJehmts33cJFqn8dvR8=;
        b=EoD+1InaQsDyzbxzPjdQQykHk/w8HYYpJ7AN8me1F+LgRO2vhC+CUYmr2j+C+qPjZ+
         KVpyCDDzrd0JG1oJ/JmxHqPbFglhV1agek46y90H8xJUzF4BJz+2eG81XrqwguWr6pyV
         qyZVCpz7IMNsvWIq7N7VA9sMMW+JkRsg5VEpTp9uVOgbUeOhvoyJ1bn3I3csHE0asdK/
         iMSXgxHqJ5eLTBdspoUv5VWOEuHx/aF/5aHwBuHo6pg5NZKEaiAVuYEL34w+CT40xEIn
         k+2Q1O4svxVyHPv3SHiQGGgQdt0wPM+XE+ZUUt0/u1MrmpcBGMpYA/q/+/GzuVf6TFRA
         dxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719848965; x=1720453765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=umkqtCJW3Dg9JtpfzIAAg1v5vJehmts33cJFqn8dvR8=;
        b=g3FlcVNwD7FwqnFj7TY4qLXKMrShh6QpiQf55IaeoiOQQ4YhsUdga75Pl6YrI0RFDA
         LQsLnZpVw+1Mr8vZkcVxcvsi8HIQXSD3YL2RqvzZAW6OKgzQNQi8ULhtQYreruiQkuhM
         aiR4LBP8xFT6gCZnpxXEoJR/Rs9CdJp7/I7ziPBTBIC+z9jzZT6ntwPGDwPnh6KoqLdJ
         5yqWagykngP21yMVIRf1YaFz6wUYkg9vzF71BFW3zEDGky02fEmGNR7tfnSWCAhNchWz
         yL8LmsCzw5aE715M+1ZXeHLu5b6qo8TmMp9X8tUD/uIdILwUSuhjfcioi8M3OxSpFOaH
         opsA==
X-Forwarded-Encrypted: i=1; AJvYcCW3ogC1N6sWqZ6acHRXgOiIeXsl/VJMXC46Rb9j5pa/Xjg4GI83A4s7u7GYRQ7ikeVcMDq2DssCLfnOfep0WVBB4wRqWATuai76rpU=
X-Gm-Message-State: AOJu0YyVpmIB/RDinB9YpdOLVQTOJJ0dZfBBLYZLoA4zC9dCtCkdsK5W
	nMITBh09B0OD71fl7vqcVcPjYkTxJiDpzHuWWAdkWDzvQKL+p5jBAlKA/wZtecY=
X-Google-Smtp-Source: AGHT+IGu9I2wc2U8NTdlZqwI73pTcvt2JvT2wJhK92JWQZzopvjsvNausRGAk2vO9Al2yPEEKQkmTw==
X-Received: by 2002:a05:690c:710:b0:64b:8e82:1f9 with SMTP id 00721157ae682-64c7123bf4amr65310827b3.18.1719848965244;
        Mon, 01 Jul 2024 08:49:25 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-64a9c405c9csm14034647b3.128.2024.07.01.08.49.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 08:49:24 -0700 (PDT)
Message-ID: <54232f3e-4fea-4996-a90b-6de51e1c51e0@sifive.com>
Date: Mon, 1 Jul 2024 10:49:23 -0500
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/13] riscv: csr: Add CSR encodings for
 VCSR_VXRM/VCSR_VXSAT
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>,
 Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>,
 Jessica Clarke <jrtc27@jrtc27.com>
References: <20240619-xtheadvector-v3-0-bff39eb9668e@rivosinc.com>
 <20240619-xtheadvector-v3-7-bff39eb9668e@rivosinc.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240619-xtheadvector-v3-7-bff39eb9668e@rivosinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Charlie,

On 2024-06-19 6:57 PM, Charlie Jenkins wrote:
> The VXRM vector csr for xtheadvector has an encoding of 0xa and VXSAT
> has an encoding of 0x9.
> 
> Co-developed-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  arch/riscv/include/asm/csr.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 18e178d83401..9086639a3dde 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -220,6 +220,8 @@
>  #define VCSR_VXRM_MASK			3
>  #define VCSR_VXRM_SHIFT			1
>  #define VCSR_VXSAT_MASK			1
> +#define VCSR_VXSAT			0x9
> +#define VCSR_VXRM			0xa

These are normal CSR indexes, so the prefix should be just "CSR_".

Regards,
Samuel

>  
>  /* symbolic CSR names: */
>  #define CSR_CYCLE		0xc00
> 

