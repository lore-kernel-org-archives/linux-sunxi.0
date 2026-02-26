Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D56399026
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Feb 2026 09:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772097535; cv=none; b=nZtmHnaFYdfilVTUD1mx4kTqFgVDz8ZTIyH8k29EK/McEZAluzf6OnaIBnr9frrhDXrtUOdEX7D0d4JS8UQRw0L3aQIZ986bXnYRymFh+TooRGKZMiFBDyvTP7mlWDSgoz9+9Ra38Vmj3LAnaOId9TNdL88KRnticRmiv2U1ldg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772097535; c=relaxed/simple;
	bh=Z+rlFlf82tJSA5RGkL3NrpaTjpsrsH5TKbIor2Iko0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RkLuVdyx0v52hCOj3NyYL4xVigVWGa8JAJX0vq0oY6GkfTOpd4Gsj1Zig3oEap3Xs8zhS9sipypMDI2v5Vfz7OV+qQ/jH3rETzWNSpdXt3zjbbCNlMqMvafNsW1kVJYEQwhTvCTrBIe5lovS0uQjBr5q4aU1H+XukxeuVvLfwCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=daGGBv51; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="daGGBv51"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCA5CC19424
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Feb 2026 09:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772097534;
	bh=Z+rlFlf82tJSA5RGkL3NrpaTjpsrsH5TKbIor2Iko0U=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=daGGBv51ajs81ihoMwHF2nl4DCUfFvWVpFDtsJp9zKdgz7btf62kmnJBtFgDv+m2j
	 KRZsrEXamIiJR6cqYKkUdSpmjQps/aRdXKW0pwzjMSn3gb6N4ndBrYIsF0g/9vqtjh
	 P0wqgyXm/b/8LM9XrzXG6P7+B31XgqNHMdV6JBDb1sVvpd3Gh+1GuoXvwsE7FtZ118
	 5ei9GW4vt9/znNlpJhmDbudDNPK5aAOHmxaaupYxOjs6GhKgrTZ5e6y9ubXgMQpCgk
	 UE6Pv4czH/kDn5ozjH++gM/jS8U82NH4tN7zX4Dhx8BGVmv97aduw6N7knz9a0ZgDR
	 DLvrNfdn4w/5w==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3870dec27f4so7101761fa.1
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Feb 2026 01:18:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUZzAwVRhBWxtppV8YOYK8sez3p6vmmsup/xQf8xtYdVK4Yeji1wwDVbxPOKN/z1ad38kfICrHqWwvVaA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyncMpQT5Mdqynz7TzcXQrB9px3bEPvZNOW9qH2dMTOt0KmDQ/7
	IcoSzddsO3mlzCRm4zC/eUvnVt8jsoXD5zuhf8j4elju0rxXC050/S0QWYDIopTL6FeVRP/YaNP
	TxYJ5sr9SFX8keS7r5y7wmyJ/FxOeS1M=
X-Received: by 2002:a05:651c:154e:b0:385:c15f:6bd with SMTP id
 38308e7fff4ca-389f1db1be7mr6846191fa.10.1772097533253; Thu, 26 Feb 2026
 01:18:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260225170045.1707778-1-wens@kernel.org> <5050123.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <5050123.GXAFRqVoOG@jernej-laptop>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 26 Feb 2026 17:18:40 +0800
X-Gmail-Original-Message-ID: <CAGb2v64ixefsSDR1bJb7uYjPWOz-7yJ=+27apx4kb+aH4ET9rA@mail.gmail.com>
X-Gm-Features: AaiRm530ZuEda_MZygW0LXGcfkJ34WBOn92bG3Hhz3-OuGkIcoYFg-ebkdtXFC8
Message-ID: <CAGb2v64ixefsSDR1bJb7uYjPWOz-7yJ=+27apx4kb+aH4ET9rA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: pine-h64: Enable USB 3.0 host
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 26, 2026 at 1:09=E2=80=AFAM Jernej =C5=A0krabec <jernej.skrabec=
@gmail.com> wrote:
>
> Dne sreda, 25. februar 2026 ob 18:00:44 Srednjeevropski standardni =C4=8D=
as je Chen-Yu Tsai napisal(a):
> > On both Pine H64 models, there is one USB 3.0 host port directly
> > connected to the SoC. The VBUS is shared with the other USB 2.0 ports.
> > Unfortunately the DWC controller binding does not have a VBUS supply.
>
> IIRC this is exactly the reason why it was never added. Adding it without
> vbus property is not a good strategy.

Or we could describe a full usb-a-connector with vbus-supply, which still
doesn't do anything ATM. I plan on working on that in the future.


ChenYu
