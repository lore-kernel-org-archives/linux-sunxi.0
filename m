Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF2E33E5
	for <linux-sunxi@lists.linux.dev>; Wed, 27 Apr 2022 19:25:07 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id m20so5314831ejj.10
        for <linux-sunxi@lists.linux.dev>; Wed, 27 Apr 2022 12:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=buJ+jfJhRXPQlaWZ59Jo560LZoPvnSVUNx60uZMSOHo=;
        b=JG4PSgWjutOAQp2rj3JZBRZFqpJvIty0sfKwfjNVfjpMXCVhnBWB1JcTs68If+hHW9
         firSR4VdhGgO/ehcbq3dXPJ4RTF89TwPXvLUK30mBybxi18h1L8tlZMrSEt05y5EO3Y7
         UdMYH6ea3ff6ZVvyuGcoavf24bfW8egImkL/3zA6JeL267CYL+oNYHRq47UVr+8XFhYm
         jiVqhKaiEyEJ47ptmHNBT+jv/ta2QNXJEPxUsE9eKCHiVzjgmX+R+eMTz6lZ+P9YaduF
         F9zeRJ2wH3iLFc59u+NINe/MxaPe5qQLhpi3hZVt2gmYSKFRc+Dm0gmaoiMZcY8dCjGy
         Sc8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=buJ+jfJhRXPQlaWZ59Jo560LZoPvnSVUNx60uZMSOHo=;
        b=juUpnfWj3d03dODxqNMDZ3mO2L9/NwagKkctVunNAe42oWTql8QRvXGsCVljlR/FFM
         VrG1M7bDB2dmTZ2iQiKMINAqxnSlzcKJlNpiH3oPW+WKODyBwrM4UQAuXpx8TFXH+yyV
         pVqwx/Z3i0t+yqmUWUlYtYauN86I5rxJxmt6TV/iLMHFQg0Bz3Rs4UIK8ZzrotxO04aS
         OJwfGbTR/+eb7nqnTJvSOQHfpUte3XLu3/WCU1nICxy14SIgj9Vy8DpFAzk6oG+Dx61f
         Ng5yvPZ/iNeNS2rMG1EK/G5r8GFH++zVgPSaXnnWh7jDuJxAapvG/tavfSG8xQFYaGef
         B7WA==
X-Gm-Message-State: AOAM532V1eik/Hp/hr9yYoCj1afQtpbHGwIzL5BJ+Y56WF5teFcIpOi4
	GTD5gW26FP3xxZA6nLHx8Qw=
X-Google-Smtp-Source: ABdhPJwe5F7BYMvqJm8UMirY3IaMe1ry6Su/8cXc2pHmRhgjZ+7fLOCgd4sgDPOK+90vEllB+cIAsg==
X-Received: by 2002:a17:906:4985:b0:6ef:b344:2a56 with SMTP id p5-20020a170906498500b006efb3442a56mr28761989eju.625.1651087506360;
        Wed, 27 Apr 2022 12:25:06 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id hf3-20020a1709072c4300b006f392c2bf71sm4700495ejc.175.2022.04.27.12.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 12:25:05 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Yong Deng <yong.deng@magewell.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maxime Ripard <mripard@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 24/45] media: sun6i-csi: Move register configuration to capture
Date: Wed, 27 Apr 2022 21:25:04 +0200
Message-ID: <5713918.MhkbZ0Pkbq@jernej-laptop>
In-Reply-To: <20220415152811.636419-25-paul.kocialkowski@bootlin.com>
References: <20220415152811.636419-1-paul.kocialkowski@bootlin.com> <20220415152811.636419-25-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 15. april 2022 ob 17:27:50 CEST je Paul Kocialkowski napisal(a):
> Continue moving things over to capture in tidy helpers.
> Also take the occasion to remove the config struct, which is
> unwelcome redundancy and use the capture helpers instead.
> 
> The code is only adapted to reflect the removal of the config
> structure. No functional change intended.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


