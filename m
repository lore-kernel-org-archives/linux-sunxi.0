Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA44135A4E
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Apr 2024 13:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713878540; cv=none; b=BMjfATQEAw2jaBVRSlvU5P3uc64jYgTInf+1tlDw2ktCPGPgkV061aSe/BF88YgJYt4M0fam97D7hWxuz9l4aqYVLnpEqYNJwioqh5T8MJmi5WMP2CuV/Arlxz+Y8/NkaeT1RQV3/LBLmLwnryrrpOvmD0rm8PTqX0MMkW/WNO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713878540; c=relaxed/simple;
	bh=Hv++gcciHk78PNTCIv/A2iJfPJVk4iYqFyoESE4aYIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NNjGTNt/tVFf8+Nzz4aEa74VtN+RrwGSiklUZ+G6BTRYW78ksEONl5+8fHFCckH90/si6I6NcaWkamI5yjv+2dPiPPbeKErDIxd3D996gZtMh9xe8EaTkssv2uGa57baWnph2+4MJ8lg2dJUdC8Vy3SmYVPhFNcYFJG9Mop1dnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bqzugrP6; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bqzugrP6"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-56e1bbdb362so6059952a12.1
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Apr 2024 06:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713878537; x=1714483337; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1n7JSfYWxQy0YOfnlGRtbUocgojCIv1pFKvACUA3fEs=;
        b=bqzugrP6YIIWLfWRI7IAjDmrfoCUaNiFgi/hy1cEzyVCZb71qtQNh83pSCZ0gfSSyf
         CWbSFoENcpTnQSxrqHjVUkZmc7Y6/v8loYyuuE2FhsWrYRzmK5sgt8YWOG5Cn8P+4vG/
         wr8qWXvLi+Fr3J6ne4Rvv7aq89Ub+4SnN7qwjmqLddkLyWRR4LX5A9ekwJ4fHBL/7g8c
         1ZYHUmyeKRnLyW6UQjpvz0lVDmbA2p8WoYCnTUb0nvdVurLaGLkRkKYdrPhbIHTHKwR3
         96bhGU/pQnchRmVksMx5pFI3MBqjJd4ZyrRuNyFMMZw5mUKB8Q4kO2uGSO0EYVeiz7/1
         FsbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713878537; x=1714483337;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1n7JSfYWxQy0YOfnlGRtbUocgojCIv1pFKvACUA3fEs=;
        b=W9pghQYfTSE8cidtpRdhgW+G0mvSJvUfvWYdHJG76RXjG7xzuXg44SflxKhv75g0WQ
         8hAH3NrtRXCOY7i3MeJQ66wzkUCneZb9Qu5sKjvLo4dw32RHApueYy3l2GatMLQulDO/
         flQpH0BbpA5cY/eAAWwO8yIjefL2KUFucvQVW5JRHX7f45LYyMh8UNnnEqgJ2p0pEW3L
         NT/b6m/zRUZjkWEJgOnLb3JmbTXPkYYIQFUh5S8CfmzWI4T2X21tG+2sM50FV1g3jDLm
         UWsWJIvKbZV4Vh4jTimEGLBwNd3DveVwonU8KaWdvuCl8KP0FxFQCfYjE8B1db0uFFlQ
         QlHg==
X-Forwarded-Encrypted: i=1; AJvYcCVIEDOFMKnkY2aPq4txOvmTgCDKQ1PMPhe4kDFCS67O5ljTmfADGsT40Lkb7+OihfaYupyPw6ymXxhJJAzJ33vXzaEMK2iGhs4IH/I=
X-Gm-Message-State: AOJu0YzpBFr3MK0QioqCw3pZZlRYp9rHgt3eU7w9YdWZOuJk6MKnwe8D
	T+5ZE0CmzgYXYayG0rE96KzQmc56NGaR8vargX8teBCsfZ+XoXMnp33agGKZJUI=
X-Google-Smtp-Source: AGHT+IFQefJU7h8rb4dkLhhIb7FlpFabv8pybeKyFHMNkkIFmzd0O8xUj7u39jSEp0mSnynBk1GipQ==
X-Received: by 2002:a17:907:1115:b0:a58:7ea5:c49b with SMTP id qu21-20020a170907111500b00a587ea5c49bmr1872927ejb.42.1713878536780;
        Tue, 23 Apr 2024 06:22:16 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id w23-20020a170907271700b00a556f2f18d6sm6980541ejk.57.2024.04.23.06.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 06:22:16 -0700 (PDT)
Date: Tue, 23 Apr 2024 16:22:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Martin Tuma <martin.tuma@digiteqautomotive.com>,
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
Subject: Re: [PATCH 11/35] media: s2255: Use refcount_t instead of atomic_t
 for num_channels
Message-ID: <cf050593-44c2-4b4b-8198-215455c630f9@moroto.mountain>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-11-477afb23728b@chromium.org>
 <d13fd47e-1ecd-4aa8-844b-cd260e9fa437@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d13fd47e-1ecd-4aa8-844b-cd260e9fa437@linaro.org>

On Tue, Apr 23, 2024 at 01:43:49PM +0100, Bryan O'Donoghue wrote:
> On 15/04/2024 20:34, Ricardo Ribalda wrote:
> > Use an API that resembles more the actual use of num_channels.
> > 
> > Found by cocci:
> > drivers/media/usb/s2255/s2255drv.c:2362:5-24: WARNING: atomic_dec_and_test variation before object free at line 2363.
> > drivers/media/usb/s2255/s2255drv.c:1557:5-24: WARNING: atomic_dec_and_test variation before object free at line 1558.
> 
> Hmm, that commit log needs more detail.
> 
> "Convert from atomic_t to refcount_t because refcount_t has memory ordering
> guarantees which atomic does not, hence the WARNING for the free after the
> atomic dec."
> 

The memory ordering rules are the same.  They're basically identical.
The difference is that if you decrement a refcount_t past zero it will
trigger an error and refuse but atomic_t will merrily keep decrementing
forever.  With refcount_t you can still have a use after free bug but
afterward the double free will trigger a warning.

There are time where people use atomic_t to get unique number and don't
care about wrapping so that's fine.  But if it's reference counting then
use refcount_t.

There wouldn't be a Fixes tag in this case, because hopefully it's just
hardenning and not a bugfix.

regards,
dan carpenter
