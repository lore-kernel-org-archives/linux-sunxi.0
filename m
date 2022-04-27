Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8819B33E5
	for <linux-sunxi@lists.linux.dev>; Wed, 27 Apr 2022 19:38:19 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id p4so3174287edx.0
        for <linux-sunxi@lists.linux.dev>; Wed, 27 Apr 2022 12:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hCum5bNhYi9+IQxe4PY50XCxjy3o4DC0Fuh+dehJ7+Y=;
        b=VBJik5g8AFV/dNWkrBZafQjns54j0x12F4VUdilD5H71dLF7idgPBxQJWUlIrgjanv
         Y2+lRpmUVfupTGVSDjK0M/xb0OYBqOR2/pAvowIALbkckDOZtxDOvKxAZgswa774Wln2
         BmneOU7/CaP42D22iEjWNGXNO3eCAgnNtLuwol6aPIx+V91QBG2pH3CCJ+w8fow6yvcE
         XcdYoOAyywJdgKE/yzDswZE/8W5axQzTuxb9UQTDgoX542p1QePG/FmiqADEwkdyvHMz
         C2RpKh4W7123+jZwN9gFwVrGGiY3GKwNTn8ZiRAM/ZjRgpTf5WV73xaN433HgDmbNbgG
         mIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hCum5bNhYi9+IQxe4PY50XCxjy3o4DC0Fuh+dehJ7+Y=;
        b=PCh7K3SSuH1P0IcOUbhIfGQo8PFAY0xcYfWAIWbxgGKXCVuwEy8NSuej59FLM73LY1
         X6kMWErV63YQn4D4d3503dyy9KpDa8sFtmexbbD92K/91QmAAlvETPpLWDUgbxTOQXQN
         /G3D6zybICf93eOT5KA5eoT5syKDIx03JyAsiQ4un5iRrpOIK63elIUKgxe4b2eJwTtF
         fEx0TWnIE0M0xTFMsBeHyDqPff8xeWJAxc1fASdWPyIElZ1bpWsySAX6v3S0dN0DjUUj
         MjTwwRGx29wryDyb0uvDEf+vzqsYYt9i4GoOJLZ2uFnkhsXvb+jmpr+msjlUy0dTxsMH
         1evw==
X-Gm-Message-State: AOAM533NumF5szut/SJs7KHQyWqf1prTfEzAc8/w8dyoBRBlJPV2xzRG
	MnPdSJBtuF+5esFp/P8mKYI=
X-Google-Smtp-Source: ABdhPJyJXe0Qcf2siNZx1NPTseSHA6cbjBTLZ1B+Ru14MQx3/wAkrvCOCledm0fwE69ujzJ4h+F56Q==
X-Received: by 2002:a50:a454:0:b0:425:e94b:2f1a with SMTP id v20-20020a50a454000000b00425e94b2f1amr17837938edb.330.1651088297951;
        Wed, 27 Apr 2022 12:38:17 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id r23-20020a056402019700b0042617ba637bsm83896edv.5.2022.04.27.12.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 12:38:17 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Yong Deng <yong.deng@magewell.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maxime Ripard <mripard@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 31/45] media: sun6i-csi: Introduce capture format structure, list and helper
Date: Wed, 27 Apr 2022 21:38:16 +0200
Message-ID: <2109482.Icojqenx9y@jernej-laptop>
In-Reply-To: <20220415152811.636419-32-paul.kocialkowski@bootlin.com>
References: <20220415152811.636419-1-paul.kocialkowski@bootlin.com> <20220415152811.636419-32-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 15. april 2022 ob 17:27:57 CEST je Paul Kocialkowski napisal(a):
> Add a table that describes each pixel format and associated output
> register configuration with necessary tweaks. It will be used later on
> to configure the hardware.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


