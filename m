Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BDF33E5
	for <linux-sunxi@lists.linux.dev>; Wed, 27 Apr 2022 19:40:44 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id y21so3148884edo.2
        for <linux-sunxi@lists.linux.dev>; Wed, 27 Apr 2022 12:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Cf6DY0z5fWdN2FcWBrgkx/oCnyUhI8bOaMl8/d5zams=;
        b=b20SaBAHJK45GUw0GjvX6yh0h5tOIe7UOx7AS4eSl1248VvPyb4yLIE1L5fFdBcmH8
         NNYJ9ZcfBVm9HBjda1bpUgAplRnc/E26I3ohmK/ZJj8ltDM7BTOnXENIGp1URN8H/c3W
         E+Skp3lUj+VnGP1o2GnPBqPT7KcNnwmzEOWFsE8B9HaclFebPXX/iDsryidnEN5Oz8JA
         reN+We0/8DNRgkhwcp5S63Ah2HrSWpDqG5/C99ljaPslV6kqYGHnIcLVlhP9Cs9anMCh
         JUwrQ+9vThdk1Po+3YzSH0K7DFnA3Inn0MCGlJ/wkiaqUB8X1HJIjF1jDpCGvnGqR4dm
         bA8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cf6DY0z5fWdN2FcWBrgkx/oCnyUhI8bOaMl8/d5zams=;
        b=AgEOsT37w/G1NJg0d261P80zZpmjgr3fa59ZV2Gq30cw/S/fT0Yy9/zPr00HcyWNNr
         dTYywQEUoCkoz5WB30OTWvlKlNPbn160D8MDRqnvAD/9MIwTAgxL2sP1xWsOqc2FtZWJ
         72MhuFHuhR2OmULJzDCLZSvQUtwdIbGky2q/XWZ94rHbGu5tt74Tf50RUbpTp2TUKROK
         IDqgXLLzSr9K/gbJtw3u+MRvGpwP7EKZhyN7w5QCQxqGWgM4mMm4Hd5kfVAv44iMQ5WM
         CMc5/66PoEdNlEAulp0TTWZY/DiKEUPAaOZid8+UGqOl4QGD40qEjOsliZf5w2p0u6pf
         62oA==
X-Gm-Message-State: AOAM532BzwtS4/uQLLlaSnqueATtU0vTGJw+0fBOZLc25XnTBJyvwsxB
	67PEegva1wxScDgEdcIiXc8=
X-Google-Smtp-Source: ABdhPJzBV9Ifb66PflKPmXLKNT3tNSgVCyI+Tn2Y1+FXeq86/gyTtVGk5f1BwyB1N6dXa+lNS/zmTA==
X-Received: by 2002:a05:6402:1cc1:b0:413:2cfb:b6ca with SMTP id ds1-20020a0564021cc100b004132cfbb6camr31200177edb.265.1651088442508;
        Wed, 27 Apr 2022 12:40:42 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id cy19-20020a0564021c9300b0042617ba6386sm90975edb.16.2022.04.27.12.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 12:40:42 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Yong Deng <yong.deng@magewell.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maxime Ripard <mripard@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 32/45] media: sun6i-csi: Configure registers from format tables
Date: Wed, 27 Apr 2022 21:40:40 +0200
Message-ID: <2366269.jE0xQCEvom@jernej-laptop>
In-Reply-To: <20220415152811.636419-33-paul.kocialkowski@bootlin.com>
References: <20220415152811.636419-1-paul.kocialkowski@bootlin.com> <20220415152811.636419-33-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 15. april 2022 ob 17:27:58 CEST je Paul Kocialkowski napisal(a):
> Switch over to using the static format table descriptions to configure
> registers. Rework the hardware configuration helpers to leverage
> information from the format structures and benefit from their logic.
> Remove the previous dedicated helpers.
> 
> The intention is to make the interaction between the different formats
> and the hardware side more visible and clear.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


