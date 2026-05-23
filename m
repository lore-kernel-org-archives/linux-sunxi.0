Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4439F28C84A
	for <linux-sunxi@lists.linux.dev>; Sat, 23 May 2026 03:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779506199; cv=pass; b=qik60KggKX0djB53ttzXmvn67ZQNdZdj4G6tZoG3Yu3ZlyicfdXN80sCiYcJbkweHSQvBNkbz/FSq9gxevZqclqPhz/H6xz94gWcdZRYbqWhUSsah1Agi8CuANmg1brxdV4tO5q/E0faTNz2PlUqlh1VpdxdDzB9gqHco6sIHMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779506199; c=relaxed/simple;
	bh=+XL9fQqEWbSHtUTzHJNem08rNzq8qxneQBBCAFW0a4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FMe7SgM9uM7uxqahj0D5ckir1VVZFHp/pknHgX0QFF9mAM6p2bPJpyiPpFT0ZSMrnnGgLDkDZkZ9hcTvKLKkJQqVN3q+8gRsz/HufTIlQryxvr+4IR4QO3q5ONr4NkTDnjN5GYb3oqafMOjFYiIY+NSkD3Q0aLfeBSYprAEWjtA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y2KRzq7w; arc=pass smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y2KRzq7w"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7dcdaf06498so5334319a34.2
        for <linux-sunxi@lists.linux.dev>; Fri, 22 May 2026 20:16:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779506195; cv=none;
        d=google.com; s=arc-20240605;
        b=Fn9aKqD6je4+lhGLiUOJzCTacNYMDukHS87E9wb3rv6AVuNbsHE8FER/5Id+jepXTT
         8FcZxYDO6LGNM1n3jNgZnST9Mtuscc24UtptXaRFOhEHKdS1nseMWzUPtKE71FGORtXP
         DmICdYe/ouP5V0Okv/RcbCs79lLSVOLD3I3cb9HXItvoMFgBOPQTMrHi9QgdECXWjfiO
         iUjO3BIjb2nfI9Tg9N1LlJ9C57Mk5asmRUtR1AfoBwokeShAkz/rkDNsyTGd4ayJdLnY
         P1aXK/I3oy5el706/4yaMCCSDdgVHXQWVOZWmzwb5gkapXx4JuTDOOtxwGrjr/11lSOV
         7Vjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+XL9fQqEWbSHtUTzHJNem08rNzq8qxneQBBCAFW0a4o=;
        fh=7Isp8LuySi36rX8FP+wxl2myERy+KIpKg0KTLfd3E5s=;
        b=IGGKNmyaMo8U7L0yXuyXdyEKjFPjMBkwDOKZB64wrhA1vGfylZnDlFEQfz6JfM1c72
         jdnSVBzXLbFNm4EayTAesdVXRB6Xrl/qXUWHtVVLmIsFVlIxoAYYkMKuw0O9+mS+0JvT
         CALjPpWK2Dnkn3Z5D5s+B0F6VUOg+qgz1FADbG0XpIUHeXgYp0DfzqDmxZlJujBkhbVh
         pC/rA9kM0FmkO0N+2Eg34ais9bYFG8HbnMwy5kLyKpUh415G8rEO/IcfNdxUJQdaaPeg
         PDVbeY5MgTkXi3tQhvof56y+17F83xfGWZkpxqzDUuZlK/k1I/PsHfe4quuaFIFsJE5Q
         6FgA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779506195; x=1780110995; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+XL9fQqEWbSHtUTzHJNem08rNzq8qxneQBBCAFW0a4o=;
        b=Y2KRzq7wTbcu8jU39kR0dUEn/FUtbRpeP2m0DD1115rYI+V0ehN6y68xk1Qw2USpZv
         /HezoS27z6OSl0aHIFMUZtUtvJo1dbiZVN9hGRboSRD59mUfk+tYp6FJCCLvlz1Qf45p
         Jq466TEdr8Ce9N2JQRz95rTaVBd0kIcbDIpcfkmmBeQzOiEuij7RhLr+5JDwL2HAl05D
         IQYmBSnGJXajaQrn8ktJC7pVe7A11/wMZ7DOZQfX9hcoIj819GiLbT27jWSKXL1Hwsfu
         ypwhqCpv8udZx6q6RgmQjD3FhyRCm+IEXlDGrWi0F2F3bwUTO/NTmO7bAf0CQj+I8Ygb
         8xbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779506195; x=1780110995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+XL9fQqEWbSHtUTzHJNem08rNzq8qxneQBBCAFW0a4o=;
        b=CNexC0ophOzHx/6Tkm7hkh/m/aFun5KCSv7PJrICJlBu2pCwuYMaHJ66DYee0slc+v
         X0zLv6wp4Vb3iNKXnoLe4mKna9J5RghaN4hpfjJE0HnPuyRsK52vlCS+d5zxvEeaH+9d
         esJVBLB9qQ9zUwoh8r3O7IJJusyS7CtWjSJVEnoWzAwFcOX9OhL0zzl8khRK9QRD45AD
         iG5oPZhPlr6dCS92r9OUgQNZENCifyBsV49Fu6jALwbpyBmFg2vbSDzyWjeP3AB4agyv
         M2GdbRknuverrIk4OPk02A7VAusgM8NK0OTiX/1vMN4ofQebqc3I3XD74z3IfsYse9jc
         zgbQ==
X-Forwarded-Encrypted: i=1; AFNElJ93HZIEE/GAXb4SQhlWEt4mDqMwSJAtydECkJ+c53S85aocKTrD3S80MDKEh6PRaa06VSLoqIG84TQYOA==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywu46ZrsxPfg6k8bLUPa2cTTq6u3YWwZkfTe1t8jQ6OIGjWbpci
	8JTZzXcb3w6po3d1M3i+bAIowH3YMK36/t09vLOYIibaJpkBj6rg9H4P6SOuypyhSCnLmtjVvN3
	D7r2ace4leab3E1GyaYGcAjE9USbvZ9M=
X-Gm-Gg: Acq92OFDcMW0nfZKha4dkQdU7Hp5X12vitxns9maSXCb+BvYbtpxCDuMDmmjw+/MFIR
	41gGi48F9Niin2w+ya7hUM7IiXy6I0yA0o8QPkjrU7zPCOW25RBSB/Qe73RMPvQyvQhdhSyYxGx
	XPl4JAiaV8lFg2ABg8S0PM4HNHWYcQzm3TFKbVuCWy9yKB9BqpxMt6hFtfUhwMxLTqTrhH0wZa+
	/DTdZhDA2Gui2+S8J5jau3xjomxDNzRa9XVS+2PXG0tojFt6XA2TqzZPVwakd+yJarcEChcs2qA
	nSr149maJ+gi3cq23rdHhlpcJHfPWS0sqRj6QZYSCZ1Ir9f2icLS7+vOrxTRk4SOBfc=
X-Received: by 2002:a05:6820:4c08:b0:69d:521d:a4fc with SMTP id
 006d021491bc7-69d7ead810amr3088050eaf.8.1779506195590; Fri, 22 May 2026
 20:16:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260518102451.417971-1-paulk@sys-base.io> <20260518102451.417971-15-paulk@sys-base.io>
 <CAMxPZkg9MgZrsM2L0vKzzUOA_tnSLKHdHkzDsfH5_WRqSQgvZg@mail.gmail.com> <ahA61YIGM4Bqipu7@collins>
In-Reply-To: <ahA61YIGM4Bqipu7@collins>
From: arash golgol <arash.golgol@gmail.com>
Date: Sat, 23 May 2026 06:45:45 +0330
X-Gm-Features: AVHnY4ISNoCKi2Ahpn2OwYGMSPucMAJaRMseXVZ6HijrWpM0v0rlwFD_MrYBAdY
Message-ID: <CAMxPZkj_2h507_3d+5aZe6b5wUrDOpA58y4OcD=D0TTj3FQcog@mail.gmail.com>
Subject: Re: [PATCH 14/16] media: sun6i-isp: Use V4L2 subdev active state
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Fri, May 22, 2026 at 2:45=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:
>
> Hi Arash,
>
> Le Thu 21 May 26, 12:53, arash golgol a =C3=A9crit :
> > I used LicheePi Zero Dock (V3s) with the following pipeline as test set=
up.
> >
> > ov5647 -> sun6i-mipi-csi2 -> sun6i-csi-bridge -> sun6i-isp-proc ->
> > sun6i-isp-capture
> >
> > I verified TRY and ACTIVE state handling, including changing TRY
> > formats without affecting ACTIVE state. Format propagation from the
> > sink (csi) pad to the source pad was also tested.
> >
> > I also tested streaming with the sensor test pattern enabled and
> > verified the captured output was correct.
> >
> > Tested-by: Arash Golgol <arash.golgol@gmail.com>
>
> Thanks a lot for testing this! Did you test just this patch or the other
> ones (especially sun6i-csi format enumeration) as well?
>

Happy to help.
I only tested patch 14 for now, but I plan to test the other patches
as well when I get some more time, especially the sun6i-csi changes.

> Also if you have an opinion on the code itself feel free to drop a
> Reviewed-by tag, a lot of this work is very similar to what you did for
> sun6i-csi and other drivers.
>

From a code perspective, the changes look good to me.
Reviewed-by: Arash Golgol <arash.golgol@gmail.com>

--=20
Regards,
Arash Golgol
