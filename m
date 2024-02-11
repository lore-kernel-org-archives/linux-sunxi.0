Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55245B5B2
	for <linux-sunxi@lists.linux.dev>; Sun, 11 Feb 2024 14:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707661464; cv=none; b=Idh1tQot6X1k8wS2hTBB9vcXsoerjLj1V6sVFBJgW7Wz+ZmY4u5dtxag7VDtmikeKSTyl2Ik/Pq7XnfI40XytACpbOf6QoEVb20L4yx9/onBuTuTScwQ5SmVZCUhBVczVbRiRJfN6nkElESgfUMTcHao+oisvanKX/dePkvS3lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707661464; c=relaxed/simple;
	bh=Tb95ezS1kuQ7AfOb9cS+P5DRUsMOemO7Zw6de/TuQY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DRdXp6jYrjAI4AFNzGWMdwa0BgoWNlt8dsjXKDAT4S4sbNRb5vWBNUH1SARkppKXjH43WLZtBZK+fisOy+/wEMJGSYKk+I6PT2YeUpXF3DwAs+idZNPHfdBixGmjtBZ8jEgHr29+nwbmBgGLz1nk2jLaYeYF6qzeK+xpUja8EsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VvR+sizb; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VvR+sizb"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5116ec49365so2621931e87.3
        for <linux-sunxi@lists.linux.dev>; Sun, 11 Feb 2024 06:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707661461; x=1708266261; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GCAOLl3pei0rSyoGXtik0PziUaBSCc9hClSrM+7S6s4=;
        b=VvR+sizbnM5W9mOq42wm48Baebj8E3py6oJ3HAcjHfkhg6k51GmaAtcdhwq9CJ/bnw
         9uXwIL9jdeU9OsBIa0EphHW1kJNqXQuV6NpyCAFvBl9TnGz4D7E5FadOLAoDO/w2RHfg
         jsYI68q/wZUrQcDS8EHyteKbXYmqSEfRIxUFX1rMXAJePoqSiQzFLfyLokKeSUb7xUvS
         hL3e3Gf5kouidoZ6QdQCArkI5tzp6s+JbtJJXsZuGl2Ac6JGEW9+KLCesXl87w+kbzzZ
         adWEH2ksc6bUIStyUxXY3HgfOUp4kmOQ0GfOXElTpBtpYulZ+2QNUCE45+xahQFZYeC0
         MXQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707661461; x=1708266261;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GCAOLl3pei0rSyoGXtik0PziUaBSCc9hClSrM+7S6s4=;
        b=QMCTdNIa16AG8JZbHKX/dab//DvLNuOXqZunq4DVBSq3wFWPwi4jk18wf0zW271HLj
         WD4J4UeZFup3b6qfXsYpXn8adQ0nT4Z41enE58SWJ4qXcEPoat2u73p6OgqfsRhh175T
         /iDkG+IK0eZ07CVdN0Jgw0tdul5SI68y2Kd2Wz9lkWzIrCdgbjXKynkX7ZxmgpLRxvae
         h+6D0dK+W8dL2AYtzJyU0Ezelf77Ib/1n7tN5AZhZVr706qbj3z3N2pOuMySNNOpFzWq
         W6WCcT2BaIFNk/7PU3rUWAH9kdX9ercXHfhCp7aAiPk44wXa7mqKTSYDHkZGCXpGUHPY
         RQUw==
X-Forwarded-Encrypted: i=1; AJvYcCUvotDARWTtX6/PtARSJHXFw/2RAHsqa01H+1DPrJRPWvlA6yVfnqsTjuTCYtxN2WEjQ1c0lNQt0WBB04u3HSPOir5k0MKZdxtgQC0=
X-Gm-Message-State: AOJu0YwvPU/i+mgqoakWdYTy6H/EMIeySSnQubap7cLB+LVCkT2F+VyJ
	ZfrvbUn1VNo/Dp669XHPg57UHmBH+vnn81/bAXbIkkAERs/ZB6HF
X-Google-Smtp-Source: AGHT+IHZpUJzzYsh4gKWkK7ZJHSVvy0xwkNJvI45AqT/LzplWFW3ITpDHyQyraOqk+co4xr+fdoUQQ==
X-Received: by 2002:a05:6512:2101:b0:511:31b4:ac16 with SMTP id q1-20020a056512210100b0051131b4ac16mr2642019lfr.47.1707661460349;
        Sun, 11 Feb 2024 06:24:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUyuas5J8CkYG9BE8O92OW7jFT2z/udTl3RiHKENMJiWoCinJ0gPn5XNXNC7qpby9Odovk2GJvJ3BLydrUUwOXp1A49uSqhIhFuebACfzNuuTnlZ4MNIggb9nFyFryjSu534so0x1Li9zdChHh0xfc1olyM9S1enIvdpH0AjPXRxJesD/7yM0aGbPdPiFjd5WdckVAb7TLdxua7URCZS2wcJYgjWGds8mFihcj+w/su8iPWctN9cnTKZ2pDzZZ6/dECXbU+A7+hR6OSugzG35J/N3Wpu9JZS/cQAo9WYBVrMVAathTcpb11015pfSs6fyoInx8JuQmuj/iycXFYGDcX8HtAFT5nrK3OlQz/kGcAWM2cBpQ6k6uCV9sGaTaaZlrFqwIeC8qhcfQ3Q1MAztw04gLEztxsI/qUc2tEgUIMYG/JyhOWdZOI/Ef9vMLjdH6W283YrI5Pg0Rubip+RPR7hGXkt9yjtTTwqRI3CLckRJlDLDa+
Received: from localhost ([2a05:3580:f312:6c01:1b8f:2a1b:d18:1951])
        by smtp.gmail.com with ESMTPSA id v8-20020a056512348800b005114e5d3515sm537766lfr.96.2024.02.11.06.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Feb 2024 06:24:19 -0800 (PST)
Date: Sun, 11 Feb 2024 17:24:19 +0300
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Arnaud Ferraris <arnaud.ferraris@collabora.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH] arm64: dts: allwinner: a64: Add thermal trip points for
 GPU
Message-ID: <ZcjYk8MD4jotKNcq@skv.local>
Mail-Followup-To: Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Arnaud Ferraris <arnaud.ferraris@collabora.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
References: <20240211105326.506049-1-andrej.skvortzov@gmail.com>
 <20240211125209.15d58462@minigeek.lan>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240211125209.15d58462@minigeek.lan>

Hi Andre,

On 24-02-11 12:52, Andre Przywara wrote:
> On Sun, 11 Feb 2024 13:53:26 +0300
> Andrey Skvortsov <andrej.skvortzov@gmail.com> wrote:
> 
> Hi Andrey,
> 
> > From: Alexey Klimov <alexey.klimov@linaro.org>
> > 
> > Without trip points for GPU, the following errors are printed in the
> > dmesg log and the sun8i-thermal driver fails to load:
> 
> So how does that post differ from Alexey one's a few weeks back:
> https://lore.kernel.org/linux-arm-kernel/20240101000008.65747-1-alexey.klimov@linaro.org/
> It seems like the same patch?

Yes, it's the same patch. I've added only information about failed
dtbs_check errors in already supported boards to commit message.
I've found this patch from June 2023 without any feedback. [1] Since I've
worked on dts changes for PinePhone A64, I've decided to resend
it. Sorry, I wasn't aware that Alexey resent it in the mean time. It's
better to continue discussion in original Alexey's patch.

> And Jernej and I had some comments (no mentioning of "Linux" in commit
> message, add cooling maps, source of trip temperature values), can you
> please try to address them?
> 
> 
> > thermal_sys: Failed to find 'trips' node
> > thermal_sys: Failed to find trip points for thermal-sensor id=1
> > sun8i-thermal: probe of 1c25000.thermal-sensor failed with error -22
> 
> I think it's pretty obvious that the trip points are missing when they
> shouldn't, so this does not need too much explanation or rationale in
> the commit message, so you can cut this short.
> 
> > When thermal zones are defined, trip points definitions are mandatory.
> > Trip values for the GPU are assumed to be the same values as the CPU
> > ones. The available specs do not provide any hints about thermal regimes
> > for the GPU and it seems GPU is implemented on the same die as the CPU.
> > 
> > 'make dtbs_check' complains about problem in dts for 18 A64-based boards
> > supported by the kernel:
> > 
> > sun50i-a64-pine64.dtb: thermal-zones: gpu0-thermal: 'trips' is a required property
> > 	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
> > sun50i-a64-pine64.dtb: thermal-zones: gpu1-thermal: 'trips' is a required property
> > 	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
> > 
> > Tested on Pine a64+ and PinePhone 1.2.
> > 
> > Cc: Samuel Holland <samuel@sholland.org>
> > Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> > Cc: Chen-Yu Tsai <wens@csie.org>
> > Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> > Cc: devicetree@vger.kernel.org
> > Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> > Tested-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
> 
> You would need your Signed-off-by: here, since you send this, even when
> on Alexey's behalf.
> 
> Cheers,
> Andre
>

1.  https://lkml.org/lkml/2023/6/4/416

-- 
Best regards,
Andrey Skvortsov
