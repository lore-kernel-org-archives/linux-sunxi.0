Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC8C1FCE
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Jul 2022 08:51:45 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id p129so7643639yba.7
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Jul 2022 01:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oCCoYwA6Xo79naahfzsaqUYKymVR7vZ6x0VBH0fAwSY=;
        b=KgEpwlYUjIxPqeS0n1sMwZBjNPdUGNT7O1KFsaFMxULZXFtpTO8+uI9BZEYUHrRhui
         E8xp9H6xkVf85Kf+anAroUSLxAlLsdeaVP2oe4C+cKgVUzFx6MCdlLLx7bOR7BNP56r7
         6d/FTvKCyYdFWnq1/TuI1gsqcnK8xJnCad9oEVp29nzWHRCXGkkLTSPVPt/MS17Rabch
         Z9wmqlW1fjc6VOog/E8ERKDe85VDa7RWtdBRtKIH5ROz2fSdJ+qFoVAI+mBOMsqqgtg6
         3miyB9HB0oSt8v7XQU9TwU/2IPoP/O42NWPtN5K/wHbkaRMbQghXlLtD+PEysiATUfJt
         aziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oCCoYwA6Xo79naahfzsaqUYKymVR7vZ6x0VBH0fAwSY=;
        b=nhuZOp7cPiRRLrrV+6WcG4+M4QfnlovzoNCwmU0ovuthQtJ9X49kQNSotgmKsvTZYo
         +q6/jSYLGub0AwOsu2qBEAf0pDwwqJ9Z3fDkw/SbfnqfNRGKvSoJGeqNiYFAWl3hBPGR
         3wdCIwxBqt/JJ5MCYSEW+5T3bJ5ccp9CSSUZmD6cQCzxSixDbtDi2pV3sm95x6GLXPet
         fW2WUQfvQGPRI+cj7XXmRc+lvZ9UvvaFHPl/UnPvKc3XILzoUF9DFiCc3WX/dYSHqLUZ
         R/VN7MD5IPs3IK9abN8NnMxmvzTGwdzZ4F/bzyF5q1x0LkM8Be5v+SgDTqd4KIAuFWBM
         Wptw==
X-Gm-Message-State: AJIora8fOtycGo3arIjFWUF4TeO4z+09nHrBwbr71DxjIjvY6axZdVDd
	PgeSzUOvixW99mbZxhTSgLjJU9+yU/jD4X1AoTQ+fA==
X-Google-Smtp-Source: AGRyM1uKbHI7q/R1gcPw/USyJqnRHCFtiAlgKUxoTaKXXMmcR+q5YmNfBJ71fCB3vqnDWcXf+Df9409dWttXpSjB83I=
X-Received: by 2002:a25:d07:0:b0:66e:6c0e:a2d1 with SMTP id
 7-20020a250d07000000b0066e6c0ea2d1mr14553827ybn.369.1657529504905; Mon, 11
 Jul 2022 01:51:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220708105235.3983266-1-andre.przywara@arm.com>
In-Reply-To: <20220708105235.3983266-1-andre.przywara@arm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 11 Jul 2022 10:51:33 +0200
Message-ID: <CACRpkdYPgFeVJurZyPnWQg2jQGvBSybrNxWDXBF4W32p_HD1_Q@mail.gmail.com>
Subject: Re: [PATCH v13 0/7] arm64: sunxi: Allwinner H616 SoC DT support
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 8, 2022 at 12:52 PM Andre Przywara <andre.przywara@arm.com> wrote:

> only some minor changes this time in the .dtsi, addressing the comments,
> many thanks to Jernej and Samuel for that! Also adding the R-b tags.

> Andre Przywara (7):
>   dt-bindings: pinctrl: sunxi: Make interrupts optional
>   dt-bindings: pinctrl: sunxi: allow vcc-pi-supply

These two (patches 2 & 4) applied to the pinctrl tree, I suppose it
is what I'm supposed to do?

If they end up also applied to the SoC tree it's not the end of the
world.

Yours,
Linus Walleij
