Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C098C17
	for <linux-sunxi@lists.linux.dev>; Mon, 13 Mar 2023 21:38:08 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-541a05e4124so80033207b3.1
        for <linux-sunxi@lists.linux.dev>; Mon, 13 Mar 2023 14:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678743488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5MoCrv9jwtexNbM0NP+aK8vItTXphA3RLnXqGbEpBLs=;
        b=oBqnejAr+cRAwqwSDggHbvyESDCGAm0IT2diFdiMbosVlO5Ebuhv06xmTVl9Mh/HiC
         neV3kaLcXxQXZ8rWMN8gaBnTm1Qs4vHbNOBsKiKclKcZXxdswwbW7rBFUKdItfCnI55B
         2ciaYsFh+G7t/+4hYcljFYbfjyaEpP3SMr2C9qEUP/kIQsFIHhlZF56rBM4WUzFRQ661
         MMseawNEKdVEkMrE+QDWzPun/jDHPZLOHsF0+5oWgZmpKX/eGOmxBPDExhV/iJDyeQ53
         7MDPKM5XS+1UdJ2cwhsUmyEm2WnUYeGW2PETZiXrAbRMWy1JxeNHHzOrvI5hsaoqnfPl
         S05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678743488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5MoCrv9jwtexNbM0NP+aK8vItTXphA3RLnXqGbEpBLs=;
        b=FLUdeW9BleWfDdgKKHoO34iVxWSCSXqE3QKZawvKl5c/MIuRHWjXh9o3lBPoa6aTqi
         tTV/nGlIPMx3hCJbrGJoaeQampCchQLqVCA2Ur9jv/6P+V651nh8GVT20c378rvT4Oa8
         8g8SZf1rqfzMoazylg1eNwTSLfTbhcUiOWNetJjYKIwQLEIFbs5z70j7UBdsWcnh1Y+0
         MqypRA6b+VOgLJxlIuFc/2JvamWDTw+g2fKdVN6pB+0T58DE2NZA1uRNhxyc6wsJkpMo
         C6ptOw6mbXGKk1yAgST/3mdLaA7qjWVySHAIGa4CiuZ9Dk6iKozQoajIQt7vnaADblC+
         8CtQ==
X-Gm-Message-State: AO0yUKVbGRNQgA2eUJ+nsifItah2OEVlog/4qnmXpfO5iiqe9v4Mb28C
	N3XhvenL+ke1VTOzsMpVaxMX4OdIBZ5C4RBhgOG75Q==
X-Google-Smtp-Source: AK7set8L1lXLBOk8wvAHM9wRqKPNXWlxKrtxI+qzt+FALwwKZEBkTpnXYO0qQldUzFZLmRJDWTgYnC/ZzTNl4HJfoug=
X-Received: by 2002:a81:ae04:0:b0:534:d71f:14e6 with SMTP id
 m4-20020a81ae04000000b00534d71f14e6mr5550337ywh.9.1678743487766; Mon, 13 Mar
 2023 14:38:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230313155138.20584-1-tzimmermann@suse.de>
In-Reply-To: <20230313155138.20584-1-tzimmermann@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Mar 2023 22:37:56 +0100
Message-ID: <CACRpkdZngHNjW0=ZtnjvNV=rfR8tip_iqTE-FDWY+ggsU6DCmw@mail.gmail.com>
Subject: Re: [PATCH v2 00/25] drm/dma-helper: Add dedicated fbdev emulation
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	airlied@gmail.com, daniel@ffwll.ch, linux-aspeed@lists.ozlabs.org, 
	dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 13, 2023 at 4:51=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:

> Tested with fbcon and IGT on vc4.

Also tested on the U8500 MCDE on Samsung GT-I8190 (Golden)
successfully.

Yours,
Linus Walleij
