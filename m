Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA43136E37
	for <linux-sunxi@lists.linux.dev>; Mon,  9 Sep 2024 17:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725902222; cv=none; b=pJoDh+7D/4gDV07cau7GVJF3AmGAfC0FZWfRtJaAuqJrHwaTW0A9Yd63OtfNFDJeu6DaCS/RipCZ2qGtY5n94WDXBlSihQKCi/LBVZCMl9bjQhX4EhM9AkGGZVXJWMtxUHj1USAQ6Fg7gysrUfbmTqjetU88eqSk/PhXbyflF2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725902222; c=relaxed/simple;
	bh=J7ZxKBd8GNjoUAMjkac/WKKJV8okz4PGJYbZ3Y3ZgkY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=avZw4+A9J/4aQYo2I5ib3LMtSBOWEcd5ut0/qIoOg/1lntqjnsDcZ31cBsCFXSYh+v4yfXAFWcVGyT4HSU7eirU1N+7cbPC37o5fsFMb+uv5EBsawRdFzNU2KErWMA1FdBOEjNMozgylahL3DNBpMV4IhhHFz1nEaJ5rhk+lJ1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fyPrg+9F; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fyPrg+9F"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20536dcc6e9so29564945ad.2
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Sep 2024 10:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725902221; x=1726507021; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hauHXk0UHvL9WIL9OJwYkRJrxeJ42bwu7guvi9wUyZ0=;
        b=fyPrg+9FDTm8thcGx3BHyqMndQBHWLvhqiBp+U3JD86IKK5Dt7UQ13k87IGDZulfyJ
         Y+hAVTjz+/bRq16Zz0X3tcmfBs+6+sknSXVf2jKcZAOL8orvUf9fLmBOA3Q2PIrDaQXs
         c0RP0/IvmiMTd/vRKfMqqJs/T0+7BeBWTZiuNNNJuLo3NC+Zb6EIslyb/3AeMx207yhr
         Hh+lTTabXE/n8j0FKIKU9FyJzWJtgwlTxHmAkCg1skfuWsr4lczWldvfxkHjKZA51pGG
         NRGS6UNNe1TTHG8JkJNgn1WKRl07NK1OFsf7j5/3hNUVeysR1UI3y1V4f40g+t4lomZj
         nSMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725902221; x=1726507021;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hauHXk0UHvL9WIL9OJwYkRJrxeJ42bwu7guvi9wUyZ0=;
        b=GS0wfI5WCG+v50xOcZDusdABK3UOiuTC/8EwPIMPOcup3bE2K/H2szbAHwyPSxfdfT
         E+Jpr3qvcxDs6agHG2YnaLKhO3CjaThnWFSbjsfVI/+Z8WtxJyvXgxIbKe6KveVAfc23
         j36585D0SOtjZZWc7xRygLNU6HDXpmzf7K8wOvIMeBqRk+CyPYwITtG5Hr/DzHQM+iMH
         7HjswjcQ5bTsWK5yvFPEzlgjLjp/amyl+4KupZmVir0Be0xZfi7pcGmxqjgI74um5zNw
         yLXk1MmycEKzTIvVXyMR38CNhxbW1htGpEkUXCPUvmRrCqi8ceVh5kt7zWjVVycCpiCF
         neNA==
X-Forwarded-Encrypted: i=1; AJvYcCU+DOcoF1SNQzkgg5vYgf8wnNsHIGDfy3KdkHnXYm/JsWx/F0aeSx2kAh5q7YwS0babE1H0KDbZ53HJ/Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1nxkJIMRANQZ+CV6NrBpxfvllRCazOlkThj9899efPyfekM+9
	0qQnqI2kC6H82bf03BrLb+3+maYS03pTiKohptoGNzK7NCE25WNG
X-Google-Smtp-Source: AGHT+IHnNeEvODa1Qt6cj+F9ZMmq0nJBVXi/m6bl9hffcSzJHoVbOj9/wfPZtg6NqY9graxO1THDuw==
X-Received: by 2002:a17:903:120d:b0:205:866d:174f with SMTP id d9443c01a7336-207070002e8mr83668675ad.44.1725902220449;
        Mon, 09 Sep 2024 10:17:00 -0700 (PDT)
Received: from ?IPV6:2601:1c2:c184:dc00:6c38:4539:e063:d0ba? ([2601:1c2:c184:dc00:6c38:4539:e063:d0ba])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710f31729sm36233705ad.261.2024.09.09.10.16.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 10:16:59 -0700 (PDT)
Message-ID: <08466bb0-4306-4941-97e1-e62ba07d8ea2@gmail.com>
Date: Mon, 9 Sep 2024 10:16:56 -0700
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sam Edwards <cfsworks@gmail.com>
Subject: Re: [PATCH v6 3/3] riscv: dts: allwinner: d1: Add thermal sensor
To: bigunclemax@gmail.com
Cc: anarsoul@gmail.com, andre.przywara@arm.com, aou@eecs.berkeley.edu,
 conor+dt@kernel.org, contact@jookia.org, cristian.ciocaltea@collabora.com,
 daniel.lezcano@linaro.org, devicetree@vger.kernel.org,
 jernej.skrabec@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sunxi@lists.linux.dev, lukasz.luba@arm.com, mkl@pengutronix.de,
 palmer@dabbelt.com, paul.walmsley@sifive.com, rafael@kernel.org,
 robh+dt@kernel.org, rui.zhang@intel.com, samuel@sholland.org,
 tiny.windzz@gmail.com, wens@csie.org
References: <20231217210629.131486-4-bigunclemax@gmail.com>
Content-Language: en-US
In-Reply-To: <20231217210629.131486-4-bigunclemax@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Maksim,

Apologies if I have failed to find a v7 of this patch in my searching, 
but I'm seeing that patch #3 here was never applied, so Linux still does 
not enable the thermal sensor in these chips. I just thought I'd give 
you a heads-up in case you weren't aware. :)

Thanks for all your hard work,
Sam
