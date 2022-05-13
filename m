Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94DE256E
	for <linux-sunxi@lists.linux.dev>; Fri, 13 May 2022 23:07:54 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-2f7ca2ce255so104328807b3.7
        for <linux-sunxi@lists.linux.dev>; Fri, 13 May 2022 16:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F7uNyZJ7+TaNFG3LYzAbirMUD+cjGo4bEKu9OQaTJA8=;
        b=msCzsb/XZaRHLnQR6GjwcKV7ZJ3DYbEc7CYntbliyw6VjYYY7ixw7AiFHlZc+Izklx
         pNNAMlyE+5PV13PbB7jKYFvxB9r8kxvMWHC7IoQkThlDpqFVfk+LPgrWw0FBBkM/t99C
         KU7eNn1q9NSsBiTOHDn3f9dxpcfd3Ri3OjeQuWvRrfUGvWjCUxq7X7rA7vZfF1S2XcO1
         bllctmzwXS+eXeeFXfvmj3iAb98agIlf6kdbiudB+qDcRPYXk+eVZPM92yi/KzDdhNUz
         sZ5w3ACTEtFfU85v08p7uXQEJTm63XmgwBP+zuQqOLqQmO2fVssF3A088F299XI4Y3Ob
         jlqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F7uNyZJ7+TaNFG3LYzAbirMUD+cjGo4bEKu9OQaTJA8=;
        b=C5vU7ZczV7gGlpQdSKYIly47ltkgYyK5l/oTKIkWSPQzRnVPT4s3LpgVpH3TXnxcHf
         iPme8L4D5XK7xGFK0UgNRZW4kmNqEaIQ2dpEWIt1ApYag7lCZLo+nCNzjFFjxj7gkQ54
         tKpn74H66YOG3P5+uNAOxInUii4Yi07ihEjPIAbU6BuL5VZHGHSbkqS/UnK5bITXzF5J
         Yqfmt21m3SxzakFm/P6Fvzun9/cOQN2rNmxOwihJTS+gyBpcAtHiHesLNAz5VBFDWWgs
         FVJ2MqSm3qXtrqUeTorTkVStFd/VV8EbBHm6W3Vkcu4j0TnqhcO0/0nMHXn36RTSvTDY
         OUaw==
X-Gm-Message-State: AOAM531F/EcltchKmdnMljsypr8HTxkFBsgNmeT/NmZM1skEqJBGQrYV
	SER5reFL14ZEl2N/JFY9mzAXNPZB+2VZumj/1exCZw==
X-Google-Smtp-Source: ABdhPJzJXhLBhVXucPYDWCcm2l1jbUwOBPd9BYGwOe67dxsApMiUe8q6RhiHgCi8xsJpw1EECBr0rLgKTXHMAPnkv0s=
X-Received: by 2002:a81:2154:0:b0:2f4:d79e:35dc with SMTP id
 h81-20020a812154000000b002f4d79e35dcmr8773559ywh.126.1652483273949; Fri, 13
 May 2022 16:07:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220504170736.2669595-1-andre.przywara@arm.com>
In-Reply-To: <20220504170736.2669595-1-andre.przywara@arm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 14 May 2022 01:07:42 +0200
Message-ID: <CACRpkdZiJqGK5NRCSWMuFBFRHOrCWyqGmuBQZ9jyvxbcsjZsgA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: f1c100s: Fix signal name comment for PA2
 SPI pin
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, writeforever@foxmail.com, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, May 4, 2022 at 7:07 PM Andre Przywara <andre.przywara@arm.com> wrote:

> The manual describes function 0x6 of pin PA2 as "SPI1_CLK", so change
> the comment to reflect that.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Patch applied, thanks Andre!

Yours,
Linus Walleij
