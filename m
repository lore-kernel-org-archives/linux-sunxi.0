Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7383072
	for <linux-sunxi@lists.linux.dev>; Wed,  8 Sep 2021 18:24:50 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id q11so4626070wrr.9
        for <linux-sunxi@lists.linux.dev>; Wed, 08 Sep 2021 11:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FlE0qMHbL5+xBmP2RU91kwGqsR+DkDaJdTbdBQ5TmKk=;
        b=o48JoJtHkBYjPAO44vHE1FRjZeflq+UFvLIUFRuK1vqw6gOsuLlMpBzWH0hQmIVvfw
         tF9Y96/la7KKN6+zBA6ax4Ptwrw4SDNMgMettvE9Xewh+Jge7x2+dN2VCE0Y/B2CpB4u
         jSnvc5EM21arIvJ0lM/RjaZ9qdGYyWkfR3IGocHrkDfYLo9zDn4gz/jX0l9/gpwAQ4Kk
         22cbe+e5TZ3nKqT27XZsz58S27CoTClzbNejH4iIw7miZKyI1EaldbpTEfr2lOtgv+Gd
         pMoosNRfOEpLH814Y6XE/3mO1TNqqSL5yJMOWr79YNPgxyG3ulyjn3l4HasxK6OTlrjX
         DA4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FlE0qMHbL5+xBmP2RU91kwGqsR+DkDaJdTbdBQ5TmKk=;
        b=M1ThBwddC64ya7qbMUsTvtl0yRk5e+qfQgoJRKUNdfFP0QmqIqXiGMVU+vfRPak+vy
         b22FGXK6L19Ov2ZNSH4YPl34ddofZBmPu1l54f2Au/EsKPaHgpv4ZdUFWKD1syMyC1Ei
         SKG3QWWIXszDMK9RdYs3pHiBOBZSbN5XrTsGB5KIyIj+1pi+EoSVOnHg4XamPWQcWFTZ
         cHMYSbRcYgCo8tqfW3A/jCIOMO8yl808qqfnMuWHV3QUICHwihxuW83mZK7I3zWKy/Iv
         00PEQUmBi88JjiWPB7ez+Ew4SbiqTgpSHrlWV6ZH309NIGjkkgJFeCWdX9wYeioFCboj
         c69w==
X-Gm-Message-State: AOAM532lkxBjqo4bqVp+hIM/pcNCex/yuO5GLRZZoQI6R2g5+iCMWfZr
	mPpCH6CMwqPkq9eN9NrULQg=
X-Google-Smtp-Source: ABdhPJwtC89X6xnx4xtVm673l7DLn0DTu6g4+HEMXMg8vrY94kM9EOD9wkdDHf52cV7Oh7FP9uExZg==
X-Received: by 2002:adf:e606:: with SMTP id p6mr5619132wrm.231.1631125488779;
        Wed, 08 Sep 2021 11:24:48 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id s14sm2580837wmc.25.2021.09.08.11.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 11:24:48 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Yong Deng <yong.deng@magewell.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, "open list:CSI DRIVERS FOR ALLWINNER V3s" <linux-media@vger.kernel.org>, "moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, Ondrej Jirman <megous@megous.com>
Cc: Ondrej Jirman <megous@megous.com>
Subject: Re: [PATCH] media: sun6i-csi: Allow the video device to be open multiple times
Date: Wed, 08 Sep 2021 20:24:47 +0200
Message-ID: <1694867.cU3HQo44PE@kista>
In-Reply-To: <20210908105609.1823449-1-megous@megous.com>
References: <20210908105609.1823449-1-megous@megous.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Ondrej!

Dne sreda, 08. september 2021 ob 12:56:09 CEST je Ondrej Jirman napisal(a):
> Previously it was possible, but a recent fix for uninitialized
> `ret` variable broke this behavior.
> 
> v4l2_fh_is_singular_file() check is there just to determine
> whether the power needs to be enabled, and it's not a failure
> if it returns false.
> 
> Fixes: ba9139116bc0538 ("media: sun6i-csi: add a missing return code")

Only 12 characters for SHA-1 ID

> Signed-off-by: Ondrej Jirman <megous@megous.com>

Otherwise:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


