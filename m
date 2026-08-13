Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006E347D440
	for <linux-sunxi@lists.linux.dev>; Thu, 13 Aug 2026 14:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786633011; cv=pass; b=VpjSkELO9z7fD/iGKI4nvpwKeePHdaQz4lkRjqtCveyWznJvObgh+zGP+HljlaOFy7tnt8+o9n2i9+XFymBUU1wuMo6qlgs13MLbUaoUzR/Aytfhw9ku04ZdUBMchguIjsnGaF4jezJXt5oypgFwFbSEKef/iTIpCWIirIZaduM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786633011; c=relaxed/simple;
	bh=Xq++Qn1xDsOmBUH579ICrWONnVsNFNIKJyDQ1d6clA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N/ukV0CkIRf+hj4JRM4cIH84v8MBMzyMTOLmlnMFBvGdJYqwnelx2hRKpacqI/wFCFmZ/EqNx54V5iH5aONz+suc1pXd5JUKVZ5Zi+2b7AfoHp2hbTx0O08AaZo3BMqq3VAUNkUDcZ0g2rCF7IOE+RWpUQfT6DXGJhVPm094p8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=QKKNFeeJ; arc=pass smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="QKKNFeeJ"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-382ef647e20so929114a91.1
        for <linux-sunxi@lists.linux.dev>; Thu, 13 Aug 2026 07:56:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786633006; cv=none;
        d=google.com; s=arc-20260327;
        b=ldbpD1WAYBxYOFXjg6IrBk+ROvo29mEGp1+ewhxvuizLOSd4hE4U4GCDcgVrEYqnOZ
         tpfZD8M+KJUHIjkzi95fUZdEYMisdwa59jSyaeYl27+bxt4dp14bN2a16kynFs3Lm6s7
         JVZoupizM5b+7x7YTehCI/k+vPPJKVLIKDCFQUsX0lULPSET7GYyJ7BfIkpK13vmhsIF
         yg6QfWCtr/oC/YCX4WkD9f4LPwU7UaGPpmA1Yy47BTO0aKncY6goYkhQbZS1o66XDm2C
         5EW4xLGWRlqOoPRN4mAhgfvuKWdgc0fS20okokpKFmCvuZ3TFe4OLvsIEv02cJwaaVwn
         +3Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Xq++Qn1xDsOmBUH579ICrWONnVsNFNIKJyDQ1d6clA4=;
        fh=629AwTBQkkqktmxaUO1fpvWNT3/k55KhcBPkYo78Z0g=;
        b=XrGsdZIeQ9axvAjJisZloKm+KqQnrJDAvRtRh5YQ66MeYk4z8op7Hp27jGItxojgMu
         aKmfb8ZGHvDiHnGbIJn5G8lHAeIcrRgyqIlnMaT/zuOnHwR/UVRJu+ITjG8EkSLnf1Hy
         Wm5uowo/JNItlw3CU8rUk25l8TZYNF+eAZSz1E9xwizpdU5Z0MXaKTvCSb3T10jlX6gf
         /JhNCKv8u8bN3AouhF1zBwTu7a5vWJ2O661+SHuxW5s4wULZbkJ2Nm7HgJ104FOWqJEF
         bEi0MyMnInoYL35OwolHpfUO4GG6G5oszAVeZLHrhPCnKSkSRrAWNka/hw9yr8t8K7mu
         Tm+w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1786633006; x=1787237806; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xq++Qn1xDsOmBUH579ICrWONnVsNFNIKJyDQ1d6clA4=;
        b=QKKNFeeJqbxooF6729xZfO9/PXNuyxu+NyjZzw8JwTguwxptimQuywR4I2Yy53Bl+f
         D6o81Nm3OIcfrZUAvb4gZB/CQcxR5Zq86/dGrIySbcuOmYXvGjtykOxByuT0+uzieKEq
         aI+FV61rqScHStEDLCOKqm/zu2ZFqin0JKKdxH30cBfCfASG80rCSpa/8PsgP9Qnd9HO
         gxZVWuQhtFFE+alg352XiH0XUJlWVORqBbS7AbT5CdedpAVCsPd4MelBT/vru+TPay3I
         omLmlogs1x+qzw7S7HD0Sb0IMTv+ApN5etM12d0sm1Y7s6/5e74m0u3rNU3V0jJPYPGW
         9HZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786633006; x=1787237806;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Xq++Qn1xDsOmBUH579ICrWONnVsNFNIKJyDQ1d6clA4=;
        b=Rs7aZ1hzSOV8bHVTOoBDeo6idEkrMYJ3zV0b422s3+jEL7jCjn7sHD+KpshyXOUDLJ
         2EkHU2m9XcmI5Mhwvk9hkyCep1+U4KhUkubHgptK1kQ61lkeXC3ywyLJZeRM8VPnVbaA
         6oHMpG34D4lBSBfcbSq07VLAek35++aPqTJQ/6ykWuK/hq0L7VPffZGetFXeqp9R8nlI
         XZ2NedxJyYUzfV7G+YxOVMDikH8vhWn/xkPkCRreDHI/41GmRUc1joCJ45tXqCO8QLq/
         jIUHKkXPkctZWXt0RVSn/tomjDpIoukgGh5kar1LDTcL3xP9pHdRRIhij+ZAgsWHzT4o
         b+zQ==
X-Forwarded-Encrypted: i=1; AHgh+Roo9od6WMw+ZB5dEzpAZOyVVD2EvblaQ425G/cdgr4ngH0exazTkWgY4HwiLn0HWRG2AxcLeYFEwCucxQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwTMYIJCn44+vueV2f0cTSoS/3nN6rJ3sW7P712VOi9fskB+t0U
	vUWQ9CxyZUBXpnt4o7rt2eqcZD7EqFiTwZrdKEtjnB3eiDDclyglrNgF0OGfHBJvis6k0TFOLrX
	Pq+L4b4iSSXkp7n5l9xfswrKEjx6pYeQf+gZIgOxWOg==
X-Gm-Gg: AR+sD13QPN48EhNoskAKr9fzSJZNLSOt1BJZXc2tQ3EAh9x3r5AScI4PhU6Cb/Hxhs5
	VoiE4S6EVVEgIJJFgNLLlSW5qmdEUqkvuEDLmG50kDKq8LdLDSgDSXiFHTFM/P05DKTcchkc+UG
	uzSglz5d3L/4xTwIT3Qa8UgJpqTXUZRwQ58WL8OUYQ7EfLbB4l7P4V7jz2pgNam0UinmdWo3LW/
	64i9hjECs/zTk8iD0JviZwxP1/HeVWYOjdZx9hs6EYllHmH/ZDzYghHyWec24i+TbYfQDfVjfXs
	OpynrEsVi+lLwWcPyMoeaFrZBwPle53r+7vildZ0dk6S
X-Received: by 2002:a17:90b:3805:b0:381:5bd6:eb19 with SMTP id
 98e67ed59e1d1-3931e2d5ad3mr6739275a91.18.1786633005755; Thu, 13 Aug 2026
 07:56:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260724-scdc-link-health-v9-0-bdda406d016d@collabora.com> <20260724-scdc-link-health-v9-2-bdda406d016d@collabora.com>
In-Reply-To: <20260724-scdc-link-health-v9-2-bdda406d016d@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 13 Aug 2026 15:56:34 +0100
X-Gm-Features: AUfX_mw_wf8mbHFBpVPiqBoHbpDY5XZSRNwpWrmFgEGAvC8xQ68IRVU4r6Y0j2I
Message-ID: <CAPj87rM3BxAf3+4UZF-qD+45bFup9FV81Xhrn98m7sewZihhGQ@mail.gmail.com>
Subject: Re: [PATCH v9 2/5] drm/scdc-helper: Add scdc_status debugfs entry
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, kernel@collabora.com, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 24 Jul 2026 at 15:23, Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
> SCDC provides status information on the current display link. At the
> very least, it may be useful to expose this info through debugfs.
>
> Add a debugfs entry for it under the connector, which displays a few
> more details parsed out of the SCDC registers. A new
> drm_scdc_debugfs_init function can be called by the connector
> implementation to initialise the debugfs file.

Reviewed-by: Daniel Stone <daniels@collabora.com>
