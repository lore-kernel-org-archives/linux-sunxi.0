Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39346BB5B
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 17:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785777075; cv=none; b=ptTys4dUhtmRz/oat/4/IYj8Ue9XHKY70NDFCqv+agi5tE5qzo3MZDikGidRTizoPn5LYb7cBpt/br0kPKGLfAT4zpZD5g8HOVyGw1NiEHe7pnKc/etVwkFDztr8x8KVZamVWnxyanAkaHrwBr0LSE5B8wTzG5z3L+wqy1H+4xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785777075; c=relaxed/simple;
	bh=YSuIcubpAROaapMQ+UdEe88i2LBQan0WAOXSP8hLezY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W6WpoHcZQycuPyCjau9m0DFgiA/ktJCzv+UnDcZ24+NKf9Nli0KfCaj1ROQy+RGhQcfBW9CDaN7r56bU0diH5uACLn2ea7Stm6v5/85PsKNfFk7dPolTQKKMW/Nh/53uSH7erIJGx+Z13wkkQVwamyO581aT8JiRI1zcDyRcjV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NfGftYnB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NfGftYnB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A1701F00ACA
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 17:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785777074;
	bh=FUo1LO52BYWcoiJd1dWpDlLgNt48xObBzCM2IkzYHyY=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=NfGftYnBfCQtA4iYivRTo6vxQG6mxmsK57/zIQ4cXNsMMGJJcKE6+iXd8OIBRG2JU
	 zURXcsGGpsRSmGIHsTSzoed9DilauVTCNRrKpiW6AtPEN5/QrQeJJGEjSFCFOZHxvs
	 VCZcKwG2fJwkvnjPy6PrktY0J+5BuG8ek44duC9ZbdWTv3wgetM/JDOmt2ddwp8mde
	 ngxktLJ117g8ktHUsZrFvng0s8r5K6R+PivfWE1hMZAy7r8rgeBIquOc79AKr8V0l1
	 QgMLkkkCnavtufeNnHO6djpj8e7C9AMRD7pHNBIuhbJNXTGJlwugsn3KZX2LeaL3Qh
	 RcQJNHDWugB4w==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39c7fd21b63so30216621fa.0
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Aug 2026 10:11:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpUFCktKA83EgEAUp5IVjG0CQgOvXVs+CguHbs/BQHNk1UZGLwhC37yy7em7wOPtCYv2bHrCx01KmerKw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzSd3wsEJ26NvOKE6IEOGbNYnecCbniKhmlHRXHSr7y9aNxjH1i
	3fMHFAAKUx9WzNiXAcxLia8BS0gC9MZHTg+QF3RPGcOigjLFUUoirLCxY+QWviiHYzmDz2ujKCF
	1NM0GwQ3gQZ1d0ybJlkIgBstrICy6Dlg=
X-Received: by 2002:a05:651c:1993:b0:39b:2757:c1d3 with SMTP id
 38308e7fff4ca-39f86123ea9mr23096581fa.9.1785777072773; Mon, 03 Aug 2026
 10:11:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1785772659.git.jernej.skrabec@gmail.com> <aec9060209473b8176eb43bc7c63c20b21306adf.1785772659.git.jernej.skrabec@gmail.com>
In-Reply-To: <aec9060209473b8176eb43bc7c63c20b21306adf.1785772659.git.jernej.skrabec@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 4 Aug 2026 01:10:59 +0800
X-Gmail-Original-Message-ID: <CAGb2v66dgpoMwpackOsKGb7JFUMP-1Vc667xFE54j5odCdpv+w@mail.gmail.com>
X-Gm-Features: AUfX_myw6C25eVU1rBodfF_fAck2j4rXU1pTMBlvs-af7cQRwy-_-acRDgCMMzA
Message-ID: <CAGb2v66dgpoMwpackOsKGb7JFUMP-1Vc667xFE54j5odCdpv+w@mail.gmail.com>
Subject: Re: [PATCH 12/13] drm/sun4i: hdmi-phy: Fix H6 8-bit MPLL config at
 594 MHz
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 12:11=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> The 8-bit entry of the last MPLL row (594 MHz) doesn't lock reliably on
> H6. 4K@60 RGB/YUV444, which is the mode that reaches this entry, doesn't
> come up.
>
> Align the value with the vendor driver. Other entries are left alone,
> they are used by lower pixel clocks which work fine.
>
> Tested with 4K@60 on a LG TV.
>
> Fixes: 0fb4b858b102 ("drm/sun4i: Add support for H6 HDMI PHY")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Acked-by: Chen-Yu Tsai <wens@kernel.org>

> ---
>  drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/sun=
4i/sun8i_hdmi_phy.c
> index 4fa69c463dc4..489ea94693ff 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
> @@ -91,7 +91,7 @@ static const struct dw_hdmi_mpll_config sun50i_h6_mpll_=
cfg[] =3D {
>                 },
>         },  {
>                 594000000, {
> -                       { 0x1a40, 0x0003 },
> +                       { 0x1a7c, 0x0003 },
>                         { 0x3b4c, 0x0003 },
>                         { 0x5a64, 0x0003 },
>                 },
> --
> 2.43.0
>
