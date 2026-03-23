Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DB53C1404
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 17:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774285671; cv=none; b=dVtq8D5I0jXZV26Gt5i4JajKrqeUGY1YPbLLYYkbBAbLttTj5ygJRWpCPN2o2rn+VpMUyTqJRH6vPQapQfRrEc5ra2CE6ADRnJn4EHVugrjHdHs4vdly7vrjmW7JdPKv8Vozv7gvPGCpV9R71qcVCg1z0dtOPfiJYSttUTc1W5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774285671; c=relaxed/simple;
	bh=9w/05BIl6C5UPAlKrmDSRzbmSzN+L5hTClA52vqlcgI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rw16eQdpRrnJ+TFr022nblUA8tSuOE/IRMUc6gy1nEzDUx1+4qmMaskckOfkKBJ8QTWOaAWS1OfFYr+gsKah1E/yMOgB//yV+84XE0tpwNVFRSQmpn3TEN6HceczcMgv0M4OivqA2pKYiHSZeMa9RbYYJ3HksHxMakGafVR3yzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38bd3bc3061so3638121fa.0
        for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 10:07:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774285665; x=1774890465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9w/05BIl6C5UPAlKrmDSRzbmSzN+L5hTClA52vqlcgI=;
        b=GlWJLnz05TVbQf5qTBNkSyf9CMAlVL8pmrZtCV7z1GyBUi3etWjaao7nuDSCG0gcL9
         70V2fgIDtn4R//yKuxPGzbCGsnOGeLi8Tg2BwwMBRWHYySJjQtXcm6iuUYx1Dv6Yrwf3
         0N9UlwM8UiKHiB56Kjo2XOe1GLIlMEVQ9TfCPb5ItK86ommvLwFYHMHFJCUx94lSpN6A
         /F16HpE48C2PdqdkLLi2EwQvmckjDfYLb7NrkA8FLguQlIWgLJwObbdK1ySuwKpYEdPY
         bNd48DIgK+G3Dkor1lhYF4t1J5MrTrbiv4k5J0aXGtG3IHEUYO3WVpfL8KCI7K/jxWhL
         3v0g==
X-Forwarded-Encrypted: i=1; AJvYcCVFlzwAsDvZA8YXfyUTXxC33Gk83ZpEFnzKwOIYhz01Si8SJaEOiQdPZG2HltIsWWvDMTxztTLNdvtyYQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxwgO8wZAEfLJ31BQceebbPB5AN2cn0m6OPRe6z/+VGTwATtFYh
	44xuwvcGWX6PDi9hoxvdjDmbfZ2b6+9IKHCoZECEonrOEqxrl/HIw4/qSvjZFCNk
X-Gm-Gg: ATEYQzw74RNiielID0b09I5PchOSAP2dYRndqrxpgSAp5esfep2U7Q/Y9r+9IhFjo8V
	hYYBpqtp7DwDnLCz5/o+N0maQv9jyTmub/xXvSPT9gAIm/GaMy+Zvgh5CwMGUfJ2kzxNjNE1tZO
	ZXgVBnKHqxXkN3qoZzVvtyiK2yhiW/sJewdlBI2QiJVU9NJhU/b/Jzwaf3yI5Atqu+StuSCg/fk
	k4HSyb/ArujwMqbu4tuy5RDA8LRmteqIbj8AdZk1X6HjNY5GAJAxcX5vQjghhrgW8e3ccyHJEDH
	sENQ6plzfZsjv4eqogCaIBPDnikI8DM3Rd2S6xfSfRU+alAkrnpkOYNJ/z7Ab4ZiK502IhxvWfn
	V9a/bqtHPLm94AIKlAujJXUJIlcRf4CB5/TN0sC3d7WpF90LNb8f9ocKeSg5vhqRHMWdNvvk7o5
	b5X+paCdNS58B6uUtsQA1UIhI5DSIO3FU5RfovUX0v2algcNg0CdD2USQ=
X-Received: by 2002:a05:651c:551:b0:386:8f97:d0b4 with SMTP id 38308e7fff4ca-38bf972822emr42857111fa.33.1774285664562;
        Mon, 23 Mar 2026 10:07:44 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf9753c7dsm28805751fa.13.2026.03.23.10.07.42
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 10:07:43 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38a27d39067so2849661fa.1
        for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 10:07:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWqAlHX2AtDiP9ZEaeSo5Cje6c/OGRYp/gN2YodG1QRgagLsL43xr37reNmtGQOXiO6OJmRG34PkbkFMg==@lists.linux.dev
X-Received: by 2002:a2e:9bd2:0:b0:38b:f0f0:e3c0 with SMTP id
 38308e7fff4ca-38bf963ddd7mr33026081fa.9.1774285662722; Mon, 23 Mar 2026
 10:07:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260323110151.2352832-1-andre.przywara@arm.com> <20260323110151.2352832-3-andre.przywara@arm.com>
In-Reply-To: <20260323110151.2352832-3-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 24 Mar 2026 01:07:30 +0800
X-Gmail-Original-Message-ID: <CAGb2v65RBGK4Tb0=2D=8_37AQDt2GL_kEwd1OjqQ6ziRWqy4tQ@mail.gmail.com>
X-Gm-Features: AQROBzA5T8F1z2ogDDbAkrNKbAgfLdiandHWSkKdFT2S7GO1Ch51csLHtutzo-M
Message-ID: <CAGb2v65RBGK4Tb0=2D=8_37AQDt2GL_kEwd1OjqQ6ziRWqy4tQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] pinctrl: sunxi: Remove unneeded IRQ remuxing for some SoCs
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michal Piekos <michal.piekos@mmpsystems.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 7:02=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> The Allwinner A10 and H3 SoCs cannot read the state of a GPIO line when
> that line is muxed for IRQ triggering (muxval 6), but only if it's
> explicitly muxed for GPIO input (muxval 0). Other SoCs do not show this
> behaviour, so we added a optional workaround, triggered by a quirk bit,
> which triggers remuxing the pin when it's configured for IRQ, while we
> need to read its value.
>
> For some reasons this quirk flag was copied over to newer SoCs, even
> though they don't show this behaviour, and the GPIO data register
> reflects the true GPIO state even with a pin configured to muxval 6
> (IRQ). The workaround is just more costly, but doesn't break otherwise,
> so this was probably never noticed by anyone.
> Experiments confirm that the H5, H6, H616 and A523 do not need this
> workaround, they show the GPIO line value with both muxval 0 and 6.
>
> Remove the unneeded quirk from those SoC's pinctrl driver description.
> This should have no obvious effect on the H5, H6, H616 (other than
> being more efficient), but the workaround is broken for the A523, so
> it fixes (one part of the) interrupt operation there.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Fixes: b8a51e95b376 ("pinctrl: sunxi: Add support for the secondary A523 =
GPIO ports")

Acked-by: Chen-Yu Tsai <wens@kernel.org>
