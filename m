Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25167156240
	for <linux-sunxi@lists.linux.dev>; Tue, 16 Apr 2024 07:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713254242; cv=none; b=SVNiidN33aBL3oXsYipcFgZxUXfxA+PjjXqBBpQhMRcpMkq7QOcVb/kLPT6kSKf/xbjuihh30yKQKlhb8xtmzy7g1fW9sHrlOmvIJyvMCXQCprZ80ep58F5mwRO/hHl85fK+bhVbvwTxg/AxDoOwvJ5Ah0V29wqSK2Om+uR0UTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713254242; c=relaxed/simple;
	bh=b31AnnXrNGswz4m57sykrNwwz1aACR/ovPuykzmKvow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z/1lyHiGpSxCkU5qQeYHW1ZgBZhkNo7JUi8eDJTP5fCUaz8Fn0aREog4YIwBBOoBI1jxwdeQ2R/Yk9IuVpr+pCKLHNJF5D6y3UysDXaUgTNpDzDttBHQYmFIEb0cTBxjSNG/DQxci8IA7rJ9zO5g5wu8j50Cez2F27A7Kd/SReI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aub/DacC; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aub/DacC"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a5544fd07easo35330966b.0
        for <linux-sunxi@lists.linux.dev>; Tue, 16 Apr 2024 00:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713254239; x=1713859039; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4HIZb2nKPjLTTz62XK4VK6Iwqa3YIDFbrj0IrJZaoNI=;
        b=aub/DacC7YBnh7keIpZi+6BLapISJsGZurfOHrLoQ/IURYrslqBM93m8WtV5TID/V1
         fyaYmx1mlElYFg+kQVX4RY3j8yL8DToiiJ2kNdSu5G8ruydxx9uMc+/Ni8VJ1fwa2fY5
         vYELlA9sCHj6XCFRKE02sL3J1NdUwa60dxUTRGEgs+XUzU3nr5q/712lf+WPZf47eTyh
         EgGDBzLqerEkPCKmrxQyobx35ae3klXxqYECvl5z4pDzmCuivj4FDoZPwfGfgKbdAOlD
         WbqZdH3t5gXE/6O6u10fW3fPJinCUGH2GCYVetu2Q1uHkzgysCJT4D6vIMPnn5d065Oi
         xPpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713254239; x=1713859039;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4HIZb2nKPjLTTz62XK4VK6Iwqa3YIDFbrj0IrJZaoNI=;
        b=wdZttbnGLm5ztmqdviHkJf08zy9FURijfMtRJn3ogC1UDtIeXKpCqvZXgXO3AaSa5v
         1UkUTa1zyudKR5JYWRZ1ztJVLxm7bgwKLFMdvoY8gdSUVyDRYwVvKyx510n9nn5b19a7
         mmh6rfZUiRWen8ttLTR/c1IEFZkmasH/9MrKb74B7cy/089vwbOF/aqlmRtwNzUX2t5F
         eBZ52wSJeHStsBHjE1LGaa9/SRCSZEDUb1ZVqYcPXlAhxjGetRkbaQAEPYkYbpCyZ+y1
         fjH3bbZ3qaFdgrvy5wDlBpRSmXBqbR+7PJtazoDzoVIr+h8ZAB9Q9B032E8Mm3YMD2/F
         tWQA==
X-Forwarded-Encrypted: i=1; AJvYcCW0vi+9Kxle2DCqOk8B4GTouWQ21dp9Eb/UMUy9q7wFhl/CByVUksBvyjfqIkmg0PU61idmCxeL6uDxQIIv7W9F5upsqm62Ye67gm8=
X-Gm-Message-State: AOJu0Yzl7O+f/gk1nmoH+NV5/6na9/JxhsCycyH+1zP3Nl89rG7s1VRy
	/9fvXgvkDHCSIuKGrdsbaNRF5MquvrqFBgPqGP7IU7A1ChWIfYTzl/rijSH2q5I=
X-Google-Smtp-Source: AGHT+IFmYom8ca5REWXBouKNnF3JyRoh/X3BZipPWdBTLAjIHlxGuqZNeTPobNF+ISHRPd4L/JQwdg==
X-Received: by 2002:a17:907:764c:b0:a52:57ad:63d0 with SMTP id kj12-20020a170907764c00b00a5257ad63d0mr4228551ejc.20.1713254234712;
        Tue, 16 Apr 2024 00:57:14 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id kf20-20020a17090776d400b00a51e9b299b9sm6444928ejc.55.2024.04.16.00.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 00:57:14 -0700 (PDT)
Date: Tue, 16 Apr 2024 10:57:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Martin Tuma <martin.tuma@digiteqautomotive.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>,
	Abylay Ospan <aospan@netup.ru>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Dmitry Osipenko <digetx@gmail.com>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 21/35] media: venus: Use div64_u64
Message-ID: <99b220ad-79e4-4920-9e90-6cd6a3349bb3@moroto.mountain>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-21-477afb23728b@chromium.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415-fix-cocci-v1-21-477afb23728b@chromium.org>

On Mon, Apr 15, 2024 at 07:34:38PM +0000, Ricardo Ribalda wrote:
> us_per_frame does not fit in 32 bits. Use the appropriate div function.
> 

Really?  It's less than one frame per second?

regards,
dan carpenter


