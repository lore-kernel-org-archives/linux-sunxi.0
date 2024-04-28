Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1AF41A89
	for <linux-sunxi@lists.linux.dev>; Sun, 28 Apr 2024 16:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714321293; cv=none; b=WG6yUYs6p8To4RkgVzTwAWAEbrngJSJraVnB0Crt414NUeNqSbpLfI6QNskNkxjwg9Ypn0H1XxgZjXPpOvVD0e43x6Q+wXf9zp4X0B84sVwLdtTyBQEXFICU3jPUBLVUUxRyLExeKIXJSetxizY4A5uD3V0GChKvrMd7poPIg54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714321293; c=relaxed/simple;
	bh=Hcq5fDpR/sRrNIDN75Dx5TGFAVJTKRZVsYxdUtcHmgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R4Dd9soOIRgfXEZaMx7+ZIIZKpslC2WaG0Pe/csQ8mNo1bajupClsc6V1b9xzxVyxoQgUIqj9FHcK1XC8YVJieQAGn2VJFQQ064VoZMV0udd7cS67Z6yMi9pna9C9IJ3kSUl7ExQv4oPST8+RlKg0n05kHMSG1Ps9kCtJeMtTnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PrV9fXLW; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PrV9fXLW"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-34d1e6ddb4bso25734f8f.3
        for <linux-sunxi@lists.linux.dev>; Sun, 28 Apr 2024 09:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714321290; x=1714926090; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDuTZksCbCwlQLX9V0u6jvPFt7dyage8pVEZZal0zuw=;
        b=PrV9fXLWFydLKYotfqdeIKugmTm6uHKM5HpJ8JqVwvxRqfc8uF+SjJdqYyVHKeQyto
         vlQVt7/no3fAlQ2Ys5r9Q8NBBxXgBwmlIsw+Xkdqe7XJHOsv9yDJljCfZenbS81Tt/L0
         QZujGBjQfQroClkFpsDMI7PP0xoMMljqI8mDSNrXnL6ZDi2aEwifztNmBLFV3Vrwgx42
         FnJSTpmhk4Ew069357mm4DBY5rAbnz/e8k9WqxY5lmTdWn+Ddl/LtSqfnqSrDj8Ujw6p
         YEXtjshxHna3AI1PP1YOhZJLfB+xYzNv8i5X/x7ydOI7tjSZqsCbqQccaRwf8epOher0
         2Cyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714321290; x=1714926090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cDuTZksCbCwlQLX9V0u6jvPFt7dyage8pVEZZal0zuw=;
        b=sACS0DjME6iz5Z4JKanZWghw7nozT8MArLiJowUDd/WP/IOGdghDGToZ1vk1pA+lRZ
         Mobk/EOeZPil6xKp5trAdWGhteF7Ix7uf26pPzo9XRXvLqdseqZSjKfrLrd88piM9oSN
         HML18Vt/TQqA2nwQfM2vIpj+TgrPvRXxhj+WV77mCxNt+Xdzq5loJZ+UZtbdGBlneHTA
         1K/UVRhZ4hE0BOgGlqNr1mxFnaWo6ciOKASemWCour8GAU3DafVgnHROC93zaTptfRdU
         S4aw27QULpWBsbmk8FaLP+gih8ElE0O/SzYS1QspHrDLUfl/CD59lpf0SDYEsp/WMraT
         g2jw==
X-Gm-Message-State: AOJu0YwjmF7rX6KG9o+T7c5ZAGxsg5KjGO17ToIt6M6XRoGBefGDFTyf
	0w825SCsoyBgIylbal7T7EcQ4UV9fCCBLsABv+V1lKRr7KnHxHeJFrirCJvB
X-Google-Smtp-Source: AGHT+IGjYdwpUTlA0OuBWcAiywyJEAlMt6d4FSbR+ySGWGSkG9AUUGI+nRHZpFfGhpFk4jtkfWjdOg==
X-Received: by 2002:a5d:6c6a:0:b0:34d:b45:9b33 with SMTP id r10-20020a5d6c6a000000b0034d0b459b33mr778495wrz.52.1714321289740;
        Sun, 28 Apr 2024 09:21:29 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id s7-20020a5d5107000000b0034c61e211a5sm6351271wrt.63.2024.04.28.09.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 09:21:29 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-sunxi@lists.linux.dev, Dragan Simic <dsimic@manjaro.org>
Cc: wens@csie.org, samuel@sholland.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] arm64: dts: allwinner: Add cache information to the SoC dtsi for
 H6
Date: Sun, 28 Apr 2024 18:21:28 +0200
Message-ID: <5773383.DvuYhMxLoT@jernej-laptop>
In-Reply-To:
 <49abb93000078c692c48c0a65ff677893909361a.1714304071.git.dsimic@manjaro.org>
References:
 <6a772756c2c677dbdaaab4a2c71a358d8e4b27e9.1714304058.git.dsimic@manjaro.org>
 <49abb93000078c692c48c0a65ff677893909361a.1714304071.git.dsimic@manjaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 28. april 2024 ob 13:40:36 GMT +2 je Dragan Simic napisal(a):
> Add missing cache information to the Allwinner H6 SoC dtsi, to allow
> the userspace, which includes lscpu(1) that uses the virtual files provided
> by the kernel under the /sys/devices/system/cpu directory, to display the
> proper H6 cache information.
> 
> Adding the cache information to the H6 SoC dtsi also makes the following
> warning message in the kernel log go away:
> 
>   cacheinfo: Unable to detect cache hierarchy for CPU 0
> 
> The cache parameters for the H6 dtsi were obtained and partially derived
> by hand from the cache size and layout specifications found in the following
> datasheets and technical reference manuals:
> 
>   - Allwinner H6 V200 datasheet, version 1.1
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


