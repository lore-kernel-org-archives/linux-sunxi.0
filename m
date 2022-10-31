Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BBE17F4
	for <linux-sunxi@lists.linux.dev>; Mon, 31 Oct 2022 09:10:44 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id a13so16535942edj.0
        for <linux-sunxi@lists.linux.dev>; Mon, 31 Oct 2022 02:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o48W/QGPdWIlzJ0mxNkgDcBycjNxJi2Vko9v4xoh1fM=;
        b=SRBSzrqxXwelI816T9OPBTFhYZwzByI38DmZmROHZ5gQYy7ow69i1Nuiniy32wVZ2M
         TGVSSNJBjCPtE0wgELBM6J+1La29BEW6lW87cfwqdCGiUzSGYRqqIBUfMIbpY9jtYVgq
         er8OSMUJxwNGK+hOpLZnVNnhQvK8rpTOweyq4zKmnZiEh5Ko3GCAqdWVWyVIQEILNzMi
         8ofjMA3mA0CQUa7hhiQnpGiGn8p3OkEIceZgJFDsknSX1Diws3SzeuYFQqjtdw8+sfah
         7ImNLCa42Wk5rUzv9IPm2u/CxayaB4tLZQqunp1MOC8NCLMkIZ1Hst5464rPI/IJ5qC/
         Gm+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o48W/QGPdWIlzJ0mxNkgDcBycjNxJi2Vko9v4xoh1fM=;
        b=zyt2Z0SqnSouZbj2b2nsSq6XFZXNhG3vcj4h9cPvlXu5PkWLGDgmbFh8Yqwk/UpTbs
         1ZHnwsvwnJEbJ3fI/pCFNzV2Q/ev8r69ORwitSDxZVtnoM+qVw6oiMoa3+D/vBGGdVA7
         EDraYWWiCmMB5sCFZXrxfSbuw9u/9bheqTuz9Peo6pcoS4jh4SSpI0jWxBVSwms+OpWa
         JUZfLKI5eEqnZO63JE4bCtY5qEBwvzDGTWOfxWPydLH/9oLQgka+RjQdhvTs4M6lTQ7J
         7xi3vg++L8Zxzsr6xkrHOhAcVvgNPECBb4tRhDwlK4KUx9DjKVtO0OYKLkpGyqLYVhvR
         iOiQ==
X-Gm-Message-State: ACrzQf1UpZdlEWzU+7bTAS8Y87lopnC7oFiA9gV9TsRnbSY82nc+L+Gn
	Z0VjijMkDxqbykW6/kLerqU=
X-Google-Smtp-Source: AMsMyM7W1MiAWrqsxt403h66Nae6oWchB8b5Le1iuYzwKU9F019jrzSr4RrlDt/Gk7cud1b/vOv8WA==
X-Received: by 2002:aa7:cf0b:0:b0:461:2271:8559 with SMTP id a11-20020aa7cf0b000000b0046122718559mr12708767edy.92.1667207442723;
        Mon, 31 Oct 2022 02:10:42 -0700 (PDT)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id y26-20020a1709063a9a00b0078246b1360fsm2725893ejd.131.2022.10.31.02.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 02:10:42 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Yong Deng <yong.deng@magewell.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maxime Ripard <mripard@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v6 16/43] media: sun6i-csi: Add bridge v4l2 subdev with port management
Date: Mon, 31 Oct 2022 10:10:41 +0100
Message-ID: <5614788.DvuYhMxLoT@kista>
In-Reply-To: <20220826183240.604834-17-paul.kocialkowski@bootlin.com>
References: <20220826183240.604834-1-paul.kocialkowski@bootlin.com> <20220826183240.604834-17-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 26. avgust 2022 ob 20:32:13 CET je Paul Kocialkowski napisal(a):
> Introduce a bridge v4l2 subdev to prepare for separation between the
> processing part (bridge) and the dma engine, which is required to
> properly support ths isp workflow later on.
> 
> Currently the bridge just manages fwnode mapping to media pads,
> using an async notifier (which was previously in the main code).
> The s_stream video op just forwards to the connected v4l2 subdev
> (sensor or MIPI CSI-2 bridge).
> 
> The video capture device is now registered after the bridge and
> attaches to it with a media link.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


