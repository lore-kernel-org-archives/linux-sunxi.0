Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C984980020
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Jan 2024 17:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706032444; cv=none; b=iOkU+lXEmRo9jzqrSjXbUNS6hPfzi8yhcR6xUsRt8x8JxHtgUWXV+iKAYUnS0RLh4WM0DFRvlMDb+c1rASpWA/2Ii2koUN6nax4r//kj1CAPkI3XICmHiNWePiJ8ILmnyd70I877Y9OQiR3IwlSV7ETn+85GATci93dWKFxGfGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706032444; c=relaxed/simple;
	bh=/Lf65r0jEFfaCyx/YVAM+/B+UJeshYc86BaIyXbVHIM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TtH+MO3EX4rPPhNaDHjAN6KePAnSQ8+BVQr7IsQ/YzDC78i97iGYCg1RWJTYtDRjSnnD/HP8x2bfu1YjG/s0dWsrl0rZs52KjmrPYr9VM+wNSmm3JR3mshJtb3RG54yTJWn2CfkrtmeKYWt/U5ZEi3eUbA4zbcQunsrBFVugtoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SEU0oojp; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SEU0oojp"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40ec3535225so3439365e9.2
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Jan 2024 09:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706032441; x=1706637241; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T9axCURSdPj5O6k/8fwokenEz2T/EczgGrNIrYgrSFE=;
        b=SEU0oojpsV4JGI1FQiFrJ6TTfHT5SYqkzuSn9eF7zlWU12AL8RATMG0/EqHPs53adp
         7HNvCcTCRzw1X0mw44wOJK7oydCqI2aEmWsj+gratzsiDaEy6gIULycRpD3NWmo9gpX2
         9Yf0VNCPcJiASIjJDXCGPBx7tdQmVB8gfPEbwOGchCxLG+A+aRwa8azUHxSrfGLSF/CI
         3uu5RzCF3ViwTK5H7Sc7IKGFjtDLar43kq1izFW9qa5q9tf+NiRSxq3mJ1HW0UrQaGyg
         xhX5kOwJBpcdZXNRaDbD/Gde9rs2tNFEKBxp+G+pT3KJI3Jq5YsZeQ296ZOra4bl/MjJ
         taSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706032441; x=1706637241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T9axCURSdPj5O6k/8fwokenEz2T/EczgGrNIrYgrSFE=;
        b=CTwxIF96I83bFFABwygnFDUGkv9SSwExERxk5lyHQsQSapirIMUJ+qmzegHJChgCfI
         HCMbwcXBjcr+SE7Q+FfNaFfvezIXIX7LHE5PacAkCRGfeoDm6dVRoKCDB6xBB5nldwah
         pVMLOZfukYJ9zOR/YlxP04tWOK/OYSg1QM3Uay8PdG0iz14t8Fuh1UhGgnAMf1OIj3AD
         RbiDP4rGcd0zCLgKJlcY2e5fmxwkr9AJIGrapxjtlkUzVKIlaYJGCOwCt7ku96mb6ajM
         kL4b1Nv+rTN4Tb0KT3QsEbR3uBUbeYfOKwcoD3WRBmfi/OWuWgFB6QjSFEvCacyNmvHK
         IW8w==
X-Gm-Message-State: AOJu0Yyviu243aVP5WivhOOc0Ml84OeFIaJsYK9cgf8m5INSDFS9zFwM
	gkJmN31Lu0EEcEch3AnUVJkAxr0b7jOk3cmKiDo0cg0mSh6jeGzq
X-Google-Smtp-Source: AGHT+IHfolV3zQWbsCi6txDpI6lqMV3lpStI7mStzT3HOm8ywicmpEIYK00D6kIX3ljjceGHtRFaog==
X-Received: by 2002:a05:600c:4657:b0:40e:5afe:a42e with SMTP id n23-20020a05600c465700b0040e5afea42emr409342wmo.247.1706032441017;
        Tue, 23 Jan 2024 09:54:01 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-14-70.dynamic.telemach.net. [86.58.14.70])
        by smtp.gmail.com with ESMTPSA id f18-20020a05600c155200b0040d87100733sm43414126wmg.39.2024.01.23.09.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 09:54:00 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-sound@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] arm64: dts: allwinner: h616: Add SPDIF device node
Date: Tue, 23 Jan 2024 18:53:59 +0100
Message-ID: <3786260.kQq0lBPeGt@jernej-laptop>
In-Reply-To: <20240122170518.3090814-8-wens@kernel.org>
References:
 <20240122170518.3090814-1-wens@kernel.org>
 <20240122170518.3090814-8-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 22. januar 2024 ob 18:05:18 CET je Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
> 
> The H616 SoC has an SPDIF transmitter hardware block, which has the same
> layout as the one in the H6, minus the receiver side.
> 
> Add a device node for it, and a default pinmux.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


