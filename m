Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A4917F4
	for <linux-sunxi@lists.linux.dev>; Mon, 31 Oct 2022 09:18:19 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id r14so16513419edc.7
        for <linux-sunxi@lists.linux.dev>; Mon, 31 Oct 2022 02:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ecCahP3NbGV/UrWYeJFBrd6bWsq75pHnaHwN/pqPc2U=;
        b=kKG6/ZIXiMapVlg3cGF3ZZBd8ugJEee+EQqOsiTFaCYHiCfxXJ53zmY5lieEH8sI75
         UPpFYhJk6gW1gUTL7EdPujVDA8hN3BlQSr/qYK8u41jJXsoTOdgwXCUTEMHallx35sX0
         Cmko9AmEYE6Np3DBfULf6QwXAUXoF4B+hCWwINHnp/1pWeo6JqwpPkncVJnXxgXD8HmN
         p5v9jLyNTjEjjLn8EEl4R/ckRl/9FpVUDAtHaJwaez2saO2727gJkXN1tgBmaL8Oh3Eb
         wA5c2Pu0+fK7AAjSmPi6iHwftOswU044EryL81nETC8U8remaxDV69Fjk8AJiclbZo3D
         t2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ecCahP3NbGV/UrWYeJFBrd6bWsq75pHnaHwN/pqPc2U=;
        b=Dp329wCze3k67feMUjF6xmNK+D09xpsWbFvvPdecWrxmqvfEWesH1o8HBuWFZT5pUy
         7O+9xkrkAhpp+qHcqX5RxZjraDQy+04g2IoRMisebXBWnJ9vooncdEGpV1m9tT9t7D+h
         xLlNjt87g4OWziHNltj1WnU4HxjOIZJRfADkLnE+vd+E/alcQbcaEYhxSrl16IbOO2/C
         rgnWwNcUVOP7wJD5bAcuSlVaCC8//PWe7HUcZc/k4VBNsCl09xH+2/+S44CJiFZS3Xaw
         IaGF7mFxvJdbJMwA8jAownAytNZ7ioRJK5CfwFulhgw9kKl4uqZkv9Y45zcjxWTmCWa7
         OJ+A==
X-Gm-Message-State: ACrzQf2TeRTCAX/MWKWZNTI5C28kvXlmV6o7f/VBghqSArz41M+UEZ9g
	M0UKSpXEn8nBXNHLSikZZeY=
X-Google-Smtp-Source: AMsMyM63sIee6jJUO+QTZM8eD94QlMVcR1aUAVyeVWqhd61IiQpO3wxZvuGEssEFhsz6dRiZfPUcdw==
X-Received: by 2002:aa7:d458:0:b0:45b:ddbf:39fa with SMTP id q24-20020aa7d458000000b0045bddbf39famr12714032edr.335.1667207898047;
        Mon, 31 Oct 2022 02:18:18 -0700 (PDT)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id a15-20020aa7cf0f000000b004616b006871sm2968662edy.82.2022.10.31.02.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 02:18:17 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Yong Deng <yong.deng@magewell.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maxime Ripard <mripard@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v6 36/43] media: sun6i-csi: Move hardware control to the bridge
Date: Mon, 31 Oct 2022 10:18:16 +0100
Message-ID: <2257327.ElGaqSPkdT@kista>
In-Reply-To: <20220826183240.604834-37-paul.kocialkowski@bootlin.com>
References: <20220826183240.604834-1-paul.kocialkowski@bootlin.com> <20220826183240.604834-37-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 26. avgust 2022 ob 20:32:33 CET je Paul Kocialkowski napisal(a):
> In order to support the isp workflow, we need to be able to configure
> the hardware from the bridge when the capture device is not used.
> 
> As a result, move all hardware configuration calls from capture to
> the bridge. Only the window configuration part (which is specific
> to using capture) remains there.
> 
> This effectively opens the way for hooking the bridge to the
> isp in the future.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


