Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C268833E5
	for <linux-sunxi@lists.linux.dev>; Wed, 27 Apr 2022 19:45:48 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id a21so3162589edb.1
        for <linux-sunxi@lists.linux.dev>; Wed, 27 Apr 2022 12:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8e+gCPJvlqdywwhA1AiT5TrxJd32pqWYt1z80gAJ+xM=;
        b=gQSTxR+FkHDwSfdSoMVdPbYiA/I52gYBxfczdKmcnbT+vpqS2RFF+v9UTumHA+kbmu
         MF47cCY2Tx4TasuAzmdefd+xoUsQgkUIs1MB99epjEFhH/zkUZ68HVxFcAnIn93reRiU
         Vf0k+AoOLk66G0LsLek8C0Mm1rdlk74bnNZMb1JdTvuqWfBizlx95z/Wtih/XzEB882T
         8oBoeM6n0co8JTo7AIm8AnSOJYKIedsfdGw1bjYuT29dtJ8LZK3zY6WfOKcbfT0wYKJt
         PgvgGl3VQXW9qVLNjnvmhKzSCvlMESRCTAjosVVQlRtw4lero8iwz4Eq92f41KaO5QE6
         V7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8e+gCPJvlqdywwhA1AiT5TrxJd32pqWYt1z80gAJ+xM=;
        b=lmfM2nOYaWoEpJdj3cmLkKmIlpQ8Sa5fH+wXJJ8FZb5lz2U0xw7dM/N1ib2SvSXVUo
         tfexrs0JQa1A45cAHkzISwzNemFwqONVjprDS24sPK78GEeKboRKuKz814PJ1ogx9R9b
         dTQw0wkWs+rf11JJdzWAYT6vrZGhZWNgUEGw4f3Ljgky3TImQHIuUt6oiMOwYrzgxRiO
         JIb35AWR7wQNLjnvGZvsGzmE9Awdm4KhfklDIdne8rJMYz+NDH4ifAKIPHwfakuDRgn7
         a+a0dXnmUbwMnSaZpN7I8IunCGRpYZmAb7yQzLh/rNY8xW8n3CSvOYt6GrLwj4Jn1uhm
         /EdA==
X-Gm-Message-State: AOAM531wK/LGKs4t8sp3MlhWb6YnRyXHUilBxfx1frsfsVHuvgsAfd4l
	SuJZWFIpyNGtm2vxQp7Zbqg=
X-Google-Smtp-Source: ABdhPJxzTho5+ipBALlWmPR6C/hsFq1JakfMu9tREjJxQW21SluLo2O/IrFXuFFKwPy/erdVkUD7dg==
X-Received: by 2002:a05:6402:4247:b0:426:1ebc:3aaa with SMTP id g7-20020a056402424700b004261ebc3aaamr2532223edb.314.1651088747055;
        Wed, 27 Apr 2022 12:45:47 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id gk20-20020a17090790d400b006f3a85db71csm3518413ejb.49.2022.04.27.12.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 12:45:46 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Yong Deng <yong.deng@magewell.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maxime Ripard <mripard@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 34/45] media: sun6i-csi: Implement capture link validation with logic
Date: Wed, 27 Apr 2022 21:45:45 +0200
Message-ID: <1900800.yKVeVyVuyW@jernej-laptop>
In-Reply-To: <20220415152811.636419-35-paul.kocialkowski@bootlin.com>
References: <20220415152811.636419-1-paul.kocialkowski@bootlin.com> <20220415152811.636419-35-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 15. april 2022 ob 17:28:00 CEST je Paul Kocialkowski napisal(a):
> Rework the capture link validate implementation with actual logic that
> reflects the possibilities of the device instead of the combinatory
> helper functions, using the match list when needed.
> Remove the previous dedicated helper.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


