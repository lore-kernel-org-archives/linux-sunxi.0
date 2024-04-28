Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05AE6BFB8
	for <linux-sunxi@lists.linux.dev>; Sun, 28 Apr 2024 16:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714321159; cv=none; b=DJ92ZexN6eY7kRpKM8xaYzKSAe6ENrWKpEClg0fvpyfIVt4qH4D9cQCNgbjrN71ZOhd6YXSj5g+1nvykWMqJWRtE8+b1vwp/gjqD9TuJFv7U8PerUd4gS6YmXRKudH7t1rlLWEFpr/gAWJUqF3kK33j9EpVcKoEg7pPS/m+cb5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714321159; c=relaxed/simple;
	bh=ulUn2Roe+pzNA/CtKdogTu9szg+ulnwZVNNaty/EbLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kaKCW/A53QkdPHIxvXPbgNdL7EnpF7T88MAj8SyexXu0HBjd8rZFKmuf+OySjjpArT1p7JVTRtcsFEVGLDdhsCb5iVY/uYOqfmExju0uoWf6qyCgjKAvY4orgTkXZoCH4GUtq05wfpYP/cfgixTUywAFIlId9OkkHHARvL36xOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSbX8sgv; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSbX8sgv"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-41ba1ba55ebso14500615e9.1
        for <linux-sunxi@lists.linux.dev>; Sun, 28 Apr 2024 09:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714321156; x=1714925956; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8wa13zwfdNflwwU+lO/hDpPql8ov9l9JWWF4zFv8PI=;
        b=iSbX8sgvVARo//2gX21bSRuNwsLYczHCeqiZEP62XHupTHQ1HKpgbFRxH7a5zJjfwf
         GyzhPBnfx9Y8450x2/k1ghh26WIHQhB+gXDomMR5S/4FK+AfpQgekE4kZkC1r2aHjLQo
         ydwdLXzLCdwqWg/SkhVZgyawqvWPhoI9TP5YqbJPqj2wjEO8z9UucI+OMrvnR9noeRH+
         3PATwbTwKMaczYjG6btorans18ewmOx70MwTw0u36r73pMkwiqn0m3xntLAtwJzmAd7F
         cR6awo8n7CvcTmX+15Wkmv+J4HY2UcMJQiOc1qZgGHOTtSEietCUI2XB6ew5pZ1HDqiK
         HFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714321156; x=1714925956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r8wa13zwfdNflwwU+lO/hDpPql8ov9l9JWWF4zFv8PI=;
        b=DR9hJpNeNuZmDIoxLzjBufrYtH8jXsyBOZwuxQjuu+9/LZLaGtcr2P8Rk2+u7bYUpf
         d9tZKaFp9mC6FvUpLNueRKdDmd4bw4sgfZn5mFpKht9xO5zR8HuOvw3m5/s9g2H/phuK
         uWhZUSrx+ANfQ2+ppjeGCoP2kl3I6nSAtvgVw7VVQr7ALZESrOuSrm2/Wwcm6HYCJLM8
         Bu0qh4JOIgYjC2x84FyrRRYJpG6lojGjmXB9hyCgojIu/QdRwYwgeGejjBxOH+lnTSdx
         9XmNuaDcfiVnIk0B8JxWpZk72ZID/A3GOehi4+CYtyvy/NSgmAyEFYkbU6f7OW2+Zycu
         78Cw==
X-Gm-Message-State: AOJu0YwOYF+d5D1Fg9TpLkRrNW2lwuuxNqMBDCtVIJqUQlZrmaBIwZfE
	c2yG7/7pLFecyhLsuOF3Np1qNVoYR2avq2NUL3tawvOUN6rHfpWmOB/ViWz7
X-Google-Smtp-Source: AGHT+IGptgXSf37/lCXJb/77nPWdb36TF7NEcazq4nRcEnOE+ZBrhWAs9b9n7VfqYJuZo01OUoWiUg==
X-Received: by 2002:a05:600c:3111:b0:41a:9fc2:a6b1 with SMTP id g17-20020a05600c311100b0041a9fc2a6b1mr7155221wmo.22.1714321155771;
        Sun, 28 Apr 2024 09:19:15 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id p8-20020a05600c358800b00418f72d9027sm36319513wmq.18.2024.04.28.09.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 09:19:15 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-sunxi@lists.linux.dev, Dragan Simic <dsimic@manjaro.org>
Cc: wens@csie.org, samuel@sholland.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] arm64: dts: allwinner: Add cache information to the SoC dtsi for
 A64
Date: Sun, 28 Apr 2024 18:19:13 +0200
Message-ID: <2726728.mvXUDI8C0e@jernej-laptop>
In-Reply-To:
 <6a772756c2c677dbdaaab4a2c71a358d8e4b27e9.1714304058.git.dsimic@manjaro.org>
References:
 <6a772756c2c677dbdaaab4a2c71a358d8e4b27e9.1714304058.git.dsimic@manjaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 28. april 2024 ob 13:40:35 GMT +2 je Dragan Simic napisal(a):
> Add missing cache information to the Allwinner A64 SoC dtsi, to allow
> the userspace, which includes lscpu(1) that uses the virtual files provided
> by the kernel under the /sys/devices/system/cpu directory, to display the
> proper A64 cache information.
> 
> While there, use a more self-descriptive label for the L2 cache node, which
> also makes it more consistent with other SoC dtsi files.
> 
> The cache parameters for the A64 dtsi were obtained and partially derived
> by hand from the cache size and layout specifications found in the following
> datasheets and technical reference manuals:
> 
>   - Allwinner A64 datasheet, version 1.1
>   - ARM Cortex-A53 revision r0p3 TRM, version E
> 
> For future reference, here's a brief summary of the documentation:
> 
>   - All caches employ the 64-byte cache line length
>   - Each Cortex-A53 core has 32 KB of L1 2-way, set-associative instruction
>     cache and 32 KB of L1 4-way, set-associative data cache
>   - The entire SoC has 512 KB of unified L2 16-way, set-associative cache
> 
> Signed-off-by: Dragan Simic <dsimic@manjaro.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


