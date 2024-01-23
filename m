Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF6280056
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Jan 2024 17:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706032136; cv=none; b=VEku+GhpyKICbbOJM2PKyAFaQKNjX4lG2hm+BUgzR+hyWXmdt+wru0qK7E6ObeH+1U1I0vOHr4V+URS9k+71LunT2M36bOUmmCWEv6xWehmv4BGuzP6xPBuCxEduUzN+96ROcj7HEavT0tpXZIeHd5OF3CSYpl0SrhpfXyaO81E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706032136; c=relaxed/simple;
	bh=QQ9uZ4Wazjii5m802qrsRtRIm765++713g/rq7dljig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VgMQ2WYJDbQMVLoDBwPaeHE7VpTHhnLmm2/B0CkdwjVTZrcGJCw3NXbhQAggOwMt82Hr2kLT2RiseTJAV6f3Of/slMDE1L5g8Nm6/rfmWRY8ZukoA9qI5P04ZHtSh6ZM49tiyaqaFnmW4JYEf7G2jDUf+S/22BRKeUc6Ff95E2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XYwCgCi7; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XYwCgCi7"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-337d99f9cdfso4070976f8f.0
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Jan 2024 09:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706032133; x=1706636933; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EUjlyaIMA5LD+Pgub4rYNwex11S+1W6zP2cY/Lr1Xls=;
        b=XYwCgCi7x8T6eMxyEyuAvSLzZd84botxpxlr9kjgeL7XDJ7QurxgWgNkanL7XuxizA
         NoBzOj9a5T40flsuurUhDLCvo/zwrK09m33zO7dz6IwoWQGtglQXXeh/GwhHO1zvzCt8
         zx4EkIabP1U7+KulNxQiq0y2M0sOB0bdhrxdL9tOb+ZHWVt0lA7R4xw28M+ABBaU8udy
         LIHynHOTpa3cVmKCAxtU00M9fPlBDxW7UUiHlDUgrSWm8HrigokLkbUrK1TsL2qKq23y
         +YcmXnZlMc4f4N/uqtlYF2K4h7d1+ftdUdKE3endPMdAYiKGt0np3gsJlQM8SENt7Ar/
         CUSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706032133; x=1706636933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EUjlyaIMA5LD+Pgub4rYNwex11S+1W6zP2cY/Lr1Xls=;
        b=t1uELBzYlAkH7uVMkaORlu8XCxjfq5+Fmh0WEEfIUcfRAJ/xkJD2d8dV7cWHyistEn
         UzL/Gaqkl+GHrdKuSjwNyb0WUMhJiVsV2KeVTftM4txFY0fid+/6CwjqADyVue7LhIv7
         c4sY/6x2wSDx9sb46OGO0p/irRflXO7Hiow+V5DqhdqWtiwqK1I1XbqpfVJ/sOnyIBZS
         Tt3S3CII7pX5yFAHDKqMHgCflQO/Tbn63NU5QkiRiLcXlFe0Ih9nwCudklVFw7KvC5rB
         CCnhLnyp1vgGGPtG2JGQspCDT6f3lLE8ztSmAbb0MqR0NjKuMqqAUxNbOriE9FKRFZAA
         PDsA==
X-Gm-Message-State: AOJu0YxGOREt83Wg6IvKkYkYuev/qYFoiY9ZhadQdeSQuJAEmgwmD4w8
	RQATMEdnSFuTa9rmSYk43YV6xVAaRVRhK4/XjlI2nj7tWMWXX18i
X-Google-Smtp-Source: AGHT+IGctHEVFEZp6eUBc8QU6uDhSqzejWNbzNEdCvC2potV0ciD/WNpi/cB1xLvCujpx1Tux5Yl1A==
X-Received: by 2002:a05:6000:1089:b0:337:c80f:6e19 with SMTP id y9-20020a056000108900b00337c80f6e19mr3407648wrw.69.1706032132766;
        Tue, 23 Jan 2024 09:48:52 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-14-70.dynamic.telemach.net. [86.58.14.70])
        by smtp.gmail.com with ESMTPSA id y6-20020a5d6146000000b003392f625adcsm7158392wrt.36.2024.01.23.09.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 09:48:52 -0800 (PST)
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
Subject:
 Re: [PATCH 1/7] dt-bindings: sound: sun4i-spdif: Fix requirements for H6
Date: Tue, 23 Jan 2024 18:48:51 +0100
Message-ID: <3271743.aeNJFYEL58@jernej-laptop>
In-Reply-To: <20240122170518.3090814-2-wens@kernel.org>
References:
 <20240122170518.3090814-1-wens@kernel.org>
 <20240122170518.3090814-2-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 22. januar 2024 ob 18:05:12 CET je Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
> 
> When the H6 was added to the bindings, only the TX DMA channel was
> added. As the hardware supports both transmit and receive functions,
> the binding is missing the RX DMA channel and is thus incorrect.
> Also, the reset control was not made mandatory.
> 
> Add the RX DMA channel for SPDIF on H6 by removing the compatible from
> the list of compatibles that should only have a TX DMA channel. And add
> the H6 compatible to the list of compatibles that require the reset
> control to be present.
> 
> Fixes: b20453031472 ("dt-bindings: sound: sun4i-spdif: Add Allwinner H6 compatible")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


