Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2BC7A
	for <linux-sunxi@lists.linux.dev>; Wed, 15 Jun 2022 15:53:32 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id me5so24160089ejb.2
        for <linux-sunxi@lists.linux.dev>; Wed, 15 Jun 2022 08:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D5ShLIbJdbDjGlxDv7D9TUkds40P1/JB5xsD295mwPM=;
        b=ciqSZu6WTLDGRSjO54NxzovGpYsYhGGsOZARVTMj+y8DfMifPnFGkOH5KV7BbJhb5k
         8S640o47KmDM86S99aJ3cBi06365fmZ9hpTCErSvRw1adrK4oe/CZ+xYxayYFKNtdlKR
         dFtFRl6r9lxLLVnSVLYLcK6ObsYHx8f5RutGYsz3yibJprsZ6aUz04aJK4zk1wTT1TEm
         94O43RAdX62nAx4IKH6DCUAbUlQZub+z2wGDEz3B8q8hMf+7HTuIw6NOz/lAvaJLYJtC
         Uz6CfSMbi2lAv5EIA0u9QhuFkAze8QTPtBPM4acfgDLEt6vQw7ON+Z/p5nZ+195qpyoU
         Cewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D5ShLIbJdbDjGlxDv7D9TUkds40P1/JB5xsD295mwPM=;
        b=riFvJuu/OiQr9UTASw0Tx8yCOZohx2voNe6Z2/hYASINlXZ+I9y3Kt1AFlw/sV7/ls
         H06Xoqxt6f2HaT2f5elVMb2VFZnZGZkUoa5rI+TH3wXVa9xK/A/Iv9t38/nhcPFzdq1r
         2BHUE4ZBLIhplccnD4OgBg8hBQ9YyaQMNHWU3hJk2FKCsucpcMuovXyG2AvZJQmQmvsL
         wIMbrIHe2HS+dcI7iK3y0KSsKULMlH/LQxEmzsO6MGPhs5HsEVMPCVwpuzR8qUxjGYdP
         sYofT5TM9nBtVEKiwKWBEus+g2R/kCf5UytYZiOva1TDeQy6BClBR4OQBFT18ldEEBxE
         zDlQ==
X-Gm-Message-State: AJIora83XrhP5ZK4PDBv6AZyU+1yOOyu1RrLIhxbVySF+AjUcFk2nl9f
	jpT+aQWan0TR6NhA6FzSbbY=
X-Google-Smtp-Source: AGRyM1sVtnrDE7GtZbaoUeUmFFWPnp7cBVKqt8WzfkzPflwAbHdYxsZncOddT9V93wqNSiltwTbHlQ==
X-Received: by 2002:a17:906:519b:b0:711:fb34:16f4 with SMTP id y27-20020a170906519b00b00711fb3416f4mr431124ejk.275.1655308410430;
        Wed, 15 Jun 2022 08:53:30 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id v14-20020aa7d9ce000000b0042bc97322desm9548790eds.43.2022.06.15.08.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 08:53:29 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Ondrej Jirman <megous@megous.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] drm/sun4i: Fix crash during suspend after component bind failure
Date: Wed, 15 Jun 2022 17:53:28 +0200
Message-ID: <3671441.kQq0lBPeGt@kista>
In-Reply-To: <20220615054254.16352-1-samuel@sholland.org>
References: <20220615054254.16352-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sreda, 15. junij 2022 ob 07:42:53 CEST je Samuel Holland napisal(a):
> If the component driver fails to bind, or is unbound, the driver data
> for the top-level platform device points to a freed drm_device. If the
> system is then suspended, the driver passes this dangling pointer to
> drm_mode_config_helper_suspend(), which crashes.
> 
> Fix this by only setting the driver data while the platform driver holds
> a reference to the drm_device.
> 
> Fixes: 624b4b48d9d8 ("drm: sun4i: Add support for suspending the display 
driver")
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


