Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9048C17
	for <linux-sunxi@lists.linux.dev>; Mon, 13 Mar 2023 21:40:20 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-5445009c26bso42155787b3.8
        for <linux-sunxi@lists.linux.dev>; Mon, 13 Mar 2023 14:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678743619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ecgxfHAz/UBXIjhNVQyUFhEfo+f44kweGIvOpc2a+8o=;
        b=K2pXxPF4Q5NEb4aJh/ZtgOcay4z11aGdPJNGxoAyPpo5KHia65JmMJB5d/8Zuyw+mk
         tdCZvErxJ2+Ov6F3uwE0QJROGtFxcgLs87rRt5F0kxCCgObLtL179NI1TBOK9gGgGNJF
         Eh1qJPWmBakRFt6FaPcxyZurn1mCFc0uppN0BduNDbYkQ+cupOSDrFYHqqBB3+fKZKrd
         MbQHQFxJIAhFilhE19dQAn6Hs0OfHLcEq+ul1IX3tDPWqnP0oSGLzgbn7d3SK+ZP02oo
         r6ydpI+oGA5J1HikH4j8Apu5N/h8d3h2Vnb/H9bp2xjP5xBYwfX+xhPNTLVqo8zyv8em
         5+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678743619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ecgxfHAz/UBXIjhNVQyUFhEfo+f44kweGIvOpc2a+8o=;
        b=P5rdNDDxOyUWegGW6SQbJIflNPn9u+Yoe1tMiGKTwCf3tIZ3Vk+CMJbHMaXk7R9yjP
         qMUsSOphqscib1FYFCHrc9A0Sv45QQPMnfb2xaKyywyxDzj66NM68AQ9KKNZ4mknke7F
         2aWD5ZwCfz68z/z7vlxeejBm4b5W3aU4HwESEm8ODmcStIfoHKjAkmc3ehVm1MFFxv9s
         8s5ihRC5kS9rZd3WwGV76wKKoeraJzILtS4TVWHLKPfTuPc05gDgEF1vVv+741gh9xc5
         tiCmKsIhXQkccPM8H0TXaqZblOMs5UrFX1w5silOwWzt2L/LgjksRm6s26si7I6mNWZ3
         r3RQ==
X-Gm-Message-State: AO0yUKUX807JlxypvYKimp+X/paMaIx3bNoNWuYRtPSYY3YVHORoaamJ
	+Fkl45k95MvVJftIAzfV23UlOn3qSXAwd7nQxmea2w==
X-Google-Smtp-Source: AK7set8MXe6q7JAQYwdFRB8ZhsrrhbkSYB8JcvLg20wPqKZq56TZe41RwUBKjK5hxxwd+ByFitU1csO05sXE3FhMJro=
X-Received: by 2002:a81:af1f:0:b0:536:4ad1:f71 with SMTP id
 n31-20020a81af1f000000b005364ad10f71mr22810681ywh.9.1678743619469; Mon, 13
 Mar 2023 14:40:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230313155138.20584-1-tzimmermann@suse.de> <20230313155138.20584-25-tzimmermann@suse.de>
In-Reply-To: <20230313155138.20584-25-tzimmermann@suse.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Mar 2023 22:40:07 +0100
Message-ID: <CACRpkdZLFuGdSqnDYXnoWEjnVmumT23Rz4Y9QT9-9=Uoj5PUpQ@mail.gmail.com>
Subject: Re: [PATCH v2 24/25] drm/mcde: Use GEM DMA fbdev emulation
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

> Use the fbdev emulation that is optimized for DMA helpers. Avoids
> possible shadow buffering and makes the code simpler.
>
> Reported-by: Linus Walleij <linus.walleij@linaro.org>
> Link: https://lore.kernel.org/dri-devel/CACRpkdawSQsNqKJkSSoSw3HmMHyNXFUy=
wxkdszpTC-a_uZA+tQ@mail.gmail.com/
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Tested-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
