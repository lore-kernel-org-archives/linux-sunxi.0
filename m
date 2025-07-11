Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D171654758
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Jul 2025 18:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752257614; cv=none; b=Vr9ZK8AhnLvMvquTEBZdpBXcG/bfowl56z24ouUdF1zV+xV7XM9j/iUgkJqHgNzGYcEqNKrLhYDcvcXNRblI8TFaAS2BiqVixoHBGpF/Hahn7Tr7azDaV5/mszh9BUJyishmvoWaZwI/EnrqYRoYeH+wxXeZAnRZgLlskB2pECc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752257614; c=relaxed/simple;
	bh=z0FAINHMrT/mXWSwLLS5ITQiWYyUydXHEsbDIHwLkNQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=svFcpDhflPYYIJhSkLKDolcrY+x1PwMWMy33inrlWYI3L+JaWA0j6gOwoobSNL3RgTQaDknhufELgCV1uaPD0SWMgkOC43iK2TY5mJY/63s4eUiZ/tCwoKGG8rjCWegEACkAPAFLGYGIBpj87v8bTKjR1W8eOT3f7ARkuyp25vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cRWiUnIn; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cRWiUnIn"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-32f1aaf0d60so21417991fa.1
        for <linux-sunxi@lists.linux.dev>; Fri, 11 Jul 2025 11:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752257611; x=1752862411; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z0FAINHMrT/mXWSwLLS5ITQiWYyUydXHEsbDIHwLkNQ=;
        b=cRWiUnIn2BjEwLrJjsc7ceBZPCCkVCpweK2SwcoA7oBVbKSFPlTcEFQefILaVtrS6y
         2EhRykiGZTjcVTibEVro2YSjYD/0qkPU7Z6vWj2MweV1RjWuAJU9m7q2TpQE39pcOawN
         ZsMip4Qua7XIZ2b3PViB2PWAFDKtQPQbp7QS7EGV5fwT5k7NZNp5/q81F4Lv6BtZvJBF
         CY40rpQAygU7c6mEiqGoqMeswqaUAOvASNyDhEFSJv+Y9tHhMY0jaMzS7E6LwStqya1u
         vNeClvtasRR7Xj1YMdv1+Oak3wCqUtnJdq/gdUD2fzUFMWtx0PYiA5LAhnHBo3rAqRCE
         iChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752257611; x=1752862411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z0FAINHMrT/mXWSwLLS5ITQiWYyUydXHEsbDIHwLkNQ=;
        b=CyYcTPdqUP1dUrJqLLi+Ti/7WJD59f82ThXokymKRgj1967zlShBbv+XLFD8yo8nrk
         XVTBbqUq76BSSc1HSwy9iLqTgwtND8yXCV4zfft+V6zyyuE5J63icoaYVdyIRgUlXRqW
         oUKVQEy6+xVQlO/FLMF0M6ve0uVQCf+eFR6aBIyUfNT0Yanz2gRkt2T2oUJp78/aB07I
         Ob4g7AnaYN3bYezfVAt6GXBAxQxMVsZwrZCQC8yPK/Ee4g5fffj+HAiUkB2bfj2555bI
         4LwH5D/TkcNMvLAm8UV91x0g8Kzela8vFo8i3pmW2vgkisLMN5kKPyNXt+4c2IxTbA2N
         +oYg==
X-Forwarded-Encrypted: i=1; AJvYcCW893nG888U8oGOtniPRI3NpMpWnSMQB8kBC2fcscpWUWBuwSpNGxZENP/F4zOljxQ81ZHlRGLgBYfUEg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzXV/Y6zMB6c4h5aJd8Xzp6FC+5qke9XoQOtP5zTbFgcNelEkOS
	Og/SfzPIzrJVq8ga5+hJtNrtqShPk5jbEzyqlkdFZ3+r0t7a8z0JfPFXkWPKGP4VTuLQoXugSGf
	de9tLATa4uhtfsLc1WQqEYDuSnR4kqRHLFSKwdrYEEQ==
X-Gm-Gg: ASbGnctRpI22M19uNiuqRPXtBrMuuilRxBWwR5IB8gaQsXQg0m4r7UKLGUqL145L6by
	jibGTyxuPfMARSq8w0lenDS/E+8rDarKbmJmYwdo2TFGpcTW4ADVmQw9CktanH7Ld7qootFxGjj
	TPQEs1Kkl1lsTi3iS5bnGrPYT8ltPEmzej058WPeCWkhcN+j2g8E1kR4Sn8TC3yxQIRuqbAUW8l
	iLC6BPIldKUCnzy+Q==
X-Google-Smtp-Source: AGHT+IFMuBYHoAN7PSAu45/CxJxrRKT9IAF0+U0X5QcMw4v0k+dSQgdIENHIG/kIkaAP4cg8rAILHrMXlK3Z+M3lDSE=
X-Received: by 2002:a2e:be83:0:b0:32a:85ad:2162 with SMTP id
 38308e7fff4ca-330532d0602mr13483321fa.7.1752257611064; Fri, 11 Jul 2025
 11:13:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250626080923.632789-1-paulk@sys-base.io> <20250626080923.632789-2-paulk@sys-base.io>
 <20250704233535.4b026641@minigeek.lan> <20250705153825.2be2b333@minigeek.lan>
 <aGm8n_wJPiGk85E4@collins> <CAGb2v66s-nWA2dFRpgX6DbDET3dWOm1jPKWm1k9SmGSqhTWoWA@mail.gmail.com>
In-Reply-To: <CAGb2v66s-nWA2dFRpgX6DbDET3dWOm1jPKWm1k9SmGSqhTWoWA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 20:13:19 +0200
X-Gm-Features: Ac12FXygNb9Ktxv1UdTrJbOKhH4l5d3j_PT8j5_pIzh_inLuA-iMK4HxDAsC-Wg
Message-ID: <CACRpkdZSXRxhNORJv5TTaf=B5dpUgXfL-PBW1qH7uKC24o=Heg@mail.gmail.com>
Subject: Re: [PATCH 1/5] pinctrl: sunxi: Fix a100 emac pin function name
To: wens@csie.org
Cc: Paul Kocialkowski <paulk@sys-base.io>, Andre Przywara <andre.przywara@arm.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 6, 2025 at 5:04=E2=80=AFPM Chen-Yu Tsai <wens@csie.org> wrote:
> On Sun, Jul 6, 2025 at 8:00=E2=80=AFAM Paul Kocialkowski <paulk@sys-base.=
io> wrote:

> > > So I would very much like to see this patch moved out. Is it just in
> > > LinusW's tree so far? I don't see it in -next yet.
> >
> > I don't think the patches were accepted for over a week so we can proba=
bly
> > still act. I will send reverts, unless maintainers want to manually rem=
ove
> > these commits?
>
> I can drop the dts patches from the sunxi tree. Linus might be able to
> drop the pinctrl patch.
>
> You definitely need to send a revert for the DT binding patch that is
> already in net-next.

I dropped the patch from the pinctrl tree, no problem.

Yours,
Linus Walleij
