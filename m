Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B0E7A
	for <linux-sunxi@lists.linux.dev>; Tue, 14 Jun 2022 15:45:58 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id gl15so18012831ejb.4
        for <linux-sunxi@lists.linux.dev>; Tue, 14 Jun 2022 08:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YSB5MTfStk1UspqZc+McpHC5WrZMD/bRWtNH57v7Pi8=;
        b=GMGDlORopVsfXCvr45KKTAZgyKiLinGmJP2++AkxuZWakX4DhNgvG1i9J6wUmCLEPZ
         pYjhhb9/n4/K3dV/LoJnfWi9Ev4QLvBEo7GBmQXWaFn43GMCGHMs6mKdDc0WvOB57thE
         b139b7GZPQW7DIQOit2W89RVb31QoAfooMGSzC2/2tk7cSUIDZEcslP5o0l3UOST1PsR
         BeBVPXDeRp2qRvNa6zAP/fGVSeEUtNg4fdJq+EOqkumXhoz5mnZBtpmE6+ZWbQC4uJRl
         TeKxjnN/Pi919oQPJn3jG6iIWR+9dEp75pCEWqlKNZYTznlUO+SPXT0a4OinMDQaE5NI
         Ex1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YSB5MTfStk1UspqZc+McpHC5WrZMD/bRWtNH57v7Pi8=;
        b=ssxmn5pHvLOE7eqseNtJTBUc6bO/mCJDCJeFpKknimzq77esLntyVLKhvef+VDasFr
         +iSX4wP5y1Syynid8ceRquTdvpAj3KeQujwHCdnwUZTmVQyqioVeNqd2QMhruh2X5Xh2
         ZO4IRVoCCetdiYatjid5DWXIHMgD/S+GtvhA8YmSXDP8MNxBN/TbmjWJcEqc4kJNPqRI
         0wOJ7laRcb2GMqlKDAxRbBwZcBR4DOpaqGjhANF919YaJuL+eSISxZX50/YLlSwYlTMx
         l1ciVfMDuclb+Mqzqs9AWR8S1wL1/9M9v2euZecAqtcsDfFSuR4cJ2WIO5Vp6XdXjTUa
         czSA==
X-Gm-Message-State: AJIora/10qcLmXe0SyLwUlcwbRGrtNDwu+HgsPL72ngQtp3CLZdv/aZa
	KaoWwdrYNY/PQVmtVcDr90Q=
X-Google-Smtp-Source: AGRyM1t6j6k1HmO4uYue7LESoFEcMf8JICSTSvZZkVWPlcUQUTc9Bxqf6cAzusx7gQvkL9WUcNPxOw==
X-Received: by 2002:a17:907:9496:b0:711:f459:664 with SMTP id dm22-20020a170907949600b00711f4590664mr4815819ejc.704.1655221557066;
        Tue, 14 Jun 2022 08:45:57 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id da26-20020a056402177a00b004315050d7dfsm7271922edb.81.2022.06.14.08.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 08:45:56 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, "H. Nikolaus Schaller" <hns@goldelico.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Neil Armstrong <narmstrong@baylibre.com>, Paul Cercueil <paul@crapouillou.net>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] drm/sun4i: dw-hdmi: Fix ddc-en GPIO consumer conflict
Date: Tue, 14 Jun 2022 17:45:55 +0200
Message-ID: <8075386.T7Z3S40VBb@kista>
In-Reply-To: <20220614073100.11550-1-samuel@sholland.org>
References: <20220614073100.11550-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 14. junij 2022 ob 09:31:00 CEST je Samuel Holland napisal(a):
> commit 6de79dd3a920 ("drm/bridge: display-connector: add ddc-en gpio
> support") added a consumer for this GPIO in the HDMI connector device.
> This new consumer conflicts with the pre-existing GPIO consumer in the
> sun8i HDMI controller driver, which prevents the driver from probing:
> 
>   [    4.983358] display-connector connector: GPIO lookup for consumer ddc-
en
>   [    4.983364] display-connector connector: using device tree for GPIO 
lookup
>   [    4.983392] gpio-226 (ddc-en): gpiod_request: status -16
>   [    4.983399] sun8i-dw-hdmi 6000000.hdmi: Couldn't get ddc-en gpio
>   [    4.983618] sun4i-drm display-engine: failed to bind 6000000.hdmi (ops 
sun8i_dw_hdmi_ops [sun8i_drm_hdmi]): -16
>   [    4.984082] sun4i-drm display-engine: Couldn't bind all pipelines 
components
>   [    4.984171] sun4i-drm display-engine: adev bind failed: -16
>   [    4.984179] sun8i-dw-hdmi: probe of 6000000.hdmi failed with error -16
> 
> Both drivers have the same behavior: they leave the GPIO active for the
> life of the device. Let's take advantage of the new implementation, and
> drop the now-obsolete code from the HDMI controller driver.
> 
> Fixes: 6de79dd3a920 ("drm/bridge: display-connector: add ddc-en gpio 
support")
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


