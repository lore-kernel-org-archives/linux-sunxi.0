Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B1C2F23
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Feb 2022 13:56:34 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id f17so20537988edd.2
        for <linux-sunxi@lists.linux.dev>; Tue, 08 Feb 2022 05:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1KYUsCDR1iSxVxCml/jhw/hl2p2+gvmglE1tOJdZtqM=;
        b=o66uVybAfrBRcV0gBzAqSGyDxUnpGYlHK6KCm3kDwxiHu/vRA1m8J/dYohiL3n9Za5
         MNrgvt72faoBRIFZPnmPPkrpxBvIcVIC0Pe+B/ByL85ExHwZYANJGS49c3khtXizgw1O
         cO5aFXwKsWjEE2MikbNR20nt5n5TT5KYggztdM2PfQ7yVHPg73GnLtGqPjGitNbMV4xJ
         z6k9+ba9gGTqK9cBX6+1qtiuEz4kFSooOoikQFPW5XWikQzezt0GGj3RfhUcAzz+NrMv
         gaiowJoGdJg3jm1tCVIGng+x1X2/JeEmmPvvTqfBESM0r84x7GdJ3rdtt/KeNL+V2IXw
         JhqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1KYUsCDR1iSxVxCml/jhw/hl2p2+gvmglE1tOJdZtqM=;
        b=wVVUPPrxcoYBfWEzCbmmFN1x+ySjsw4r0Sw2TNlXzaJDgxF53UQZff+sESdKP1mRMC
         QS/F/Q6YgVzpO64u95rg64cyptckWtjSCBMevnK8gdSSY0SfOZBzfS6I6gZoqDgMDnnt
         WtnRCjafHUDXdVXyeVCiuWcqDes/Yy/oMEe2kP+YvYCaPsxlK665wtsQgR7fOVxt7sti
         0z4g3NH5iTJfWWwkc+v33/1kPTFNpoRGkeBmyvk+Vo+lSkyIQcWQ4wbFIv9OJC6IUMWY
         LKXN51mcI29IWGVph19RXHQwS/iB523mgN6r1osXj6al/ZvPFeY9RKDutbonzj8nBU+p
         7HvA==
X-Gm-Message-State: AOAM530jF989XghiSYAt78x53FoPuGX7XB8+ruNbXwd/QRCFse3Z8RID
	f/LAAwSFrS2cGipijuvKFtE=
X-Google-Smtp-Source: ABdhPJz3LX7wIZPAbp6gWO8Drhb3MvhaAYJoOWHVG2tsxZV9Z+BCcBLk/+m7XzGikZs67sbnnktU/w==
X-Received: by 2002:aa7:c043:: with SMTP id k3mr4546167edo.184.1644328592616;
        Tue, 08 Feb 2022 05:56:32 -0800 (PST)
Received: from jernej-laptop.localnet (89-212-178-211.dynamic.t-2.net. [89.212.178.211])
        by smtp.gmail.com with ESMTPSA id t8sm1620679eji.94.2022.02.08.05.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 05:56:32 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Maxime Ripard <maxime@cerno.tech>
Cc: dri-devel@lists.freedesktop.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 18/23] drm/sun4i: layer: Remove redundant zpos initialisation
Date: Tue, 08 Feb 2022 14:56:29 +0100
Message-ID: <3469895.R56niFO833@jernej-laptop>
In-Reply-To: <20220207163515.1038648-19-maxime@cerno.tech>
References: <20220207163515.1038648-1-maxime@cerno.tech> <20220207163515.1038648-19-maxime@cerno.tech>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Maxime,

Dne ponedeljek, 07. februar 2022 ob 17:35:10 CET je Maxime Ripard napisal(a):
> The sun4i KMS driver will call drm_plane_create_zpos_property() with an
> init value depending on the plane type.
> 
> Since the initial value wasn't carried over in the state, the driver had
> to set it again in sun4i_backend_layer_reset().
> However, the helpers have been adjusted to set it properly at reset, so
> this is not needed anymore.
> 
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-sunxi@lists.linux.dev
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


