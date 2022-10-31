Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CCD17F4
	for <linux-sunxi@lists.linux.dev>; Mon, 31 Oct 2022 09:06:11 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id q9so27812312ejd.0
        for <linux-sunxi@lists.linux.dev>; Mon, 31 Oct 2022 02:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0snT4n//h/2k97Qobb3JRu1DhhY5eqFOKQUrnEmwJA=;
        b=EadVQDvXTd2a2c0lt8q3h3DJE69Qed2JO2ph+XpyOEsWL16C732jST4btYtzdn2prT
         GBR/zf4c/Sc5wlSPe0lnAgDD/DhuKBTm3jE6FNHx3x/4/TxkJyrre16xDYCd056nLkKv
         hSQy0iOkqLK8uMaWYFemSgXMeue6NXfSazQhL6EsF9gKVotozpakMkM03mKocbrL/FuZ
         YU1OwhUCtHQMtfq96N58S9fFhSjoN7Ow6DsfPx5wYPKstLxFC1Lt0hiM9EIfY/kpdCiO
         AtbWuIAE+a4VfUzcnTGoxGfh0/ZRsuSu3pzC4Bl3gzg89zDO0EisQG/+MbWB/HYnaWsc
         a8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g0snT4n//h/2k97Qobb3JRu1DhhY5eqFOKQUrnEmwJA=;
        b=cxgqgdb9+4c3fFlZyRLwWPI4RVDGoX+a9ilVNlORJnuPoJzaQuAY+OdAdllmzKS4ki
         5D2Cy1Rf0Sl/bSzugSw1ZtO3/z4RzgaCdNsVE+ZGey/a+tbocDup0arhpN0VySEjFXP9
         AALr1PlaLAy4/3oVZmcQ24RFCalPxDCbMYxDnoFSuBbCt829UEf+tnxvVX+5SZuYpFsw
         6OK/Bxoz8Xp2yv765gjGLmVPC/715FAfpyj73mfb8I6R74eq9Q+BUfuPqBzG1+2owCrL
         h/KH9nMQpoWOeSEvbZG/B5hj8f4bGTIh/EMCPKRW7wgvc9PdQZCkk8OdaZ2J+AebPwD2
         xeJQ==
X-Gm-Message-State: ACrzQf2jzzxIcvD0Gb7eb8BzP312HFFHgOpN/n7i28cl0YjotT2ymHTG
	pEOaqRfl3inS+d8dSYjXtwc=
X-Google-Smtp-Source: AMsMyM5L86KUeUMD4iAbsJdWgAWfeyjlYpqLNh5oE8wsCNG6E5CxxPG16p/8/6NFW/9K27pE18u3OA==
X-Received: by 2002:a17:907:b07:b0:7a8:beb3:aa2a with SMTP id h7-20020a1709070b0700b007a8beb3aa2amr11742021ejl.459.1667207169941;
        Mon, 31 Oct 2022 02:06:09 -0700 (PDT)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id jx24-20020a170907761800b00730bfe6adc4sm2752122ejc.37.2022.10.31.02.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 02:06:09 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Yong Deng <yong.deng@magewell.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maxime Ripard <mripard@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v6 12/43] media: sun6i-csi: Remove controls handler from the driver
Date: Mon, 31 Oct 2022 10:06:07 +0100
Message-ID: <2651862.mvXUDI8C0e@kista>
In-Reply-To: <20220826183240.604834-13-paul.kocialkowski@bootlin.com>
References: <20220826183240.604834-1-paul.kocialkowski@bootlin.com> <20220826183240.604834-13-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 26. avgust 2022 ob 20:32:09 CET je Paul Kocialkowski napisal(a):
> The driver does not expose controls directly and thus does not need
> a controls handler for its own use.
> 
> Controls attached to subdevs used to be exposed that way, however this
> can easily lead to issue when multiple subdevs attached to the same
> v4l2 device expose the same controls. Subdev controls should be set
> through each individual subdev node instead.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


