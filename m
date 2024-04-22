Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2D2481B3
	for <linux-sunxi@lists.linux.dev>; Mon, 22 Apr 2024 06:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713768803; cv=none; b=YbY9wh04oyNrO42JChgDtudBHhMN/yj889VWbDqjATJhvFgQqmpxLiqPN2YJq9xpWyAxkfuydWCf/6fYzoP6nmmdIRcfGAa1l0hNtSGveLyJIbAWMLED+7A6es5ey8Z+jfn9yl7kEts0wibl/UqetcrOFatc8bqXRY4BKcrySxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713768803; c=relaxed/simple;
	bh=WyWHeoU/Ff7umbOe8XQrl/qZdNdvHSjb9SSotewTso8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oKCDXmWpB0hINT+oy5LToNd/ZoQL4STs1S734sxny1D8ezWW1bHt/mfsbx1MKXlZ4s8SzixywpV0Ayy/SuJVaoG6hZXB6gUK0WbvKEd1lglG9ys0as9fTJR28JlmXqrnwiGmuAecgOvU4cuLJaJJN6AgGQRccYxalMu3qIpaLHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=M1R0/GUA; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="M1R0/GUA"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5af2358c7e5so73940eaf.0
        for <linux-sunxi@lists.linux.dev>; Sun, 21 Apr 2024 23:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713768800; x=1714373600; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dg+W9++cTuSKiuuJU3BmFvsGHmcNsDKvQ8sCokwEeZM=;
        b=M1R0/GUAtWnNn7zxpjuv++O9K4Ywg17G2Rdh7Pze1WJ2HtiwbkP7nZXja5ZwG84qRn
         SCzDhZ6jwMwS0xPU+XqdGW5VIr+zTiV8zKHxNL9c46tuctI8vvuxAJbROuszuwyCCqwV
         J19zgjwipnF7qZO1B20JMR2R4P4fUauvRNQB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713768800; x=1714373600;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dg+W9++cTuSKiuuJU3BmFvsGHmcNsDKvQ8sCokwEeZM=;
        b=IcYX67Y3Kx6yRHKOfr9/uSfgOBg1hppFxivplTXxU9qlMaHmfZSFYEnfmzvGJHc3fI
         jQc4HuIoU7Dow8Wy7Bsh6BwiiobDbenvoTVsQpKD+cpY3/tttfgxEk/ZjA9vypPXITp6
         f5uv01b1ZVrd2iCk2G7S8vhavRE38dYvpzGBJezDYE9TaRxg8uIhBUIliJe+5CR6zO0R
         G0+99AU/ZlG71Ozq+rmxBQwuKnDLxU/MOn20e3TWBLVccozLNvxMCtEHnjkRmEsrc+RB
         0T+RcgDHdSobvUR+m8MsiPMuXYyUNgk1TvV8sZFn61flO9gOBlSse5MuAFBugn3nEWOd
         Z2zA==
X-Forwarded-Encrypted: i=1; AJvYcCWthtldZV8i7zMKBfPlF8Q6cDVwN4/6ouRf33JteHlbLpzSm9766NjvBHkoY7x53Rh1i70/0QbZDVMQsIe7uOVhtX6k6shvBgz+re8=
X-Gm-Message-State: AOJu0Yyx7Jf8laKF+KCv8PxLarUKpENVmHHHnLApSapRAFzcnE5esDjQ
	9cDvVNQoSP5I7m+YyZN/C+ZN5WFuP2StScEv1jYfQJeh+hQiwLmDJPCCwF4vak1BmmiycnlRTvM
	BDA==
X-Google-Smtp-Source: AGHT+IG/hhhQWd+z56KuEe5OvIq2jixrHGD9VELziUbJrCJCSfbDg5xuUjdBrP+fvzx/Q4mQbfx4Og==
X-Received: by 2002:a05:6870:e612:b0:22e:935e:7637 with SMTP id q18-20020a056870e61200b0022e935e7637mr12696999oag.0.1713768800650;
        Sun, 21 Apr 2024 23:53:20 -0700 (PDT)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com. [209.85.160.46])
        by smtp.gmail.com with ESMTPSA id qr5-20020a056870ef8500b00238abc3bb0bsm1851217oab.40.2024.04.21.23.53.20
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Apr 2024 23:53:20 -0700 (PDT)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-2348a5d1584so1758652fac.2
        for <linux-sunxi@lists.linux.dev>; Sun, 21 Apr 2024 23:53:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWCNZKkvkGIXFD1DimHQ+YvV2R0w4Mnav4dtsBRjXRpZL7DnTy8NC96cHj2po8RZchgQM1JJTbS2IxqjTpe10nfpG3D2qF+T08FAks=
X-Received: by 2002:a0c:ec88:0:b0:69b:1aec:88fb with SMTP id
 u8-20020a0cec88000000b0069b1aec88fbmr9872064qvo.23.1713768779447; Sun, 21 Apr
 2024 23:52:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
 <20240419-fix-cocci-v2-6-2119e692309c@chromium.org> <124e35b3-5b0d-4bd7-848a-5c848b339157@linaro.org>
In-Reply-To: <124e35b3-5b0d-4bd7-848a-5c848b339157@linaro.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 22 Apr 2024 14:52:43 +0800
X-Gmail-Original-Message-ID: <CANiDSCt34D8-Ys+DbEQM0SyFdBF4WoV5_+xuuCjVbf22kT0xfw@mail.gmail.com>
Message-ID: <CANiDSCt34D8-Ys+DbEQM0SyFdBF4WoV5_+xuuCjVbf22kT0xfw@mail.gmail.com>
Subject: Re: [PATCH v2 06/26] media: stm32-dcmipp: Remove redundant printk
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Hugues Fruchet <hugues.fruchet@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Dmitry Osipenko <digetx@gmail.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Bryan

Thanks for your review

On Sun, 21 Apr 2024 at 07:15, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 19/04/2024 10:47, Ricardo Ribalda wrote:
> > -     if (irq <= 0) {
> <snip>
> > -             return irq ? irq : -ENXIO;
> > -     }
>
> You're dropping the original intent of the driver author there no ? when
> irq == 0 they want to return -ENXIO.

platform_get_irq() can never return 0.
https://lore.kernel.org/linux-media/cd4aac19-c4cf-4db0-a18c-42f1bf1441a8@moroto.mountain/

Let me add that to the commit message.

Thanks!

>
> ---
> bod



-- 
Ricardo Ribalda
