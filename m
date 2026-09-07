Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0205302155
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Sep 2026 04:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756316; cv=pass; b=shYQ8M0Jq072YUJRQcWXlZGnCwEa7iOUOQpXYsU8sYE9GUUybo7lMrflFL0qxgEGOBYyIq3Y6QVXgz/DSpXbL2x/8UWuSGYxBzzDduFL8qFecEdmQ9VZYsqhhNGLlZzxBDQVKcvNzJu2rs9kd1IJWoGZyqQZHIx800gykzACCno=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756316; c=relaxed/simple;
	bh=zC1w4EkKZqsmCEBeSg9Ze6B0PIqbALjemuPYfMxHiBE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MeK1gR4+KzN4fAWp1LW6JcgsK+bdpsuRI70sDXr7dgyG7qa29c1liaJnYolrjuXxtZhDsiPV78ppxr9Fv7K535WaevtaaRhyEuBfDVD/14HalScEkVo7u32EYGNj0eO/SplGCzzXhw2EQW/bVkfCiE8ueH08ZfA0aPDckmK/exo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lzdSXix4; arc=pass smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lzdSXix4"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6aca0f482e5so3555070eaf.2
        for <linux-sunxi@lists.linux.dev>; Sun, 06 Sep 2026 21:45:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788756313; cv=none;
        d=google.com; s=arc-20260327;
        b=syg+9V++jKix4HIcpd9iCFkv+B64bjETEegOcBKxvG79r83yQ3h+iHAV/ArD+yuptM
         BN8cMQ0yvNuEQWkta+V3Tto5/aKNTjoJ1kwzLCEm02rtXWGRVOe0ZFtU8PIBSrz0EQYW
         zD21uXEtHDiU6nZXTbXxfOlew/gIPD+vuB5aPFZb3DnUgmlbeKFVl8wOqaZJ7lLekFuu
         ScX5hdFVRyvnf4FtDq9XvhX19VMaL+ABqs9B5HQmzPQVhb6mVbhL1IXeTnSs/zrvMok0
         WPiDYgnFzoyFrLyth1uGPFK//XQLj5wnrl2MjAdR7axYpT0chKmBlWC7OLTEMEpbhakH
         mK6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G7qjWXGXsxkTDtjG+v9DutrMwqHR45zXHmJ8Wl9xjoo=;
        fh=SQEtReNLv0jPhdZBRZSoxcWPs6gcAVKv4uYXPz56c9c=;
        b=DZEF1wnlIuyHg+9ELjGlddg1lrpp8/HnG9zBsWP/Qqnt4arLB8QOxh4aLHp7rGdoqo
         11LVXwCFJ1yoVH4/seD1z7li2M3zfXJBUqFsBaqvlGPb8zpWnGtqlq1MxdMJKiWoMnHN
         t8NRJuJBLHteGUwomcWmsg62MxtmSTkKdF7WQly/aAr39V6KdYgFGivYRZ7Szh+Ua2Wy
         BnT6/HGCtXhI7Y7sEG64EA0m2+OnWNhaHad463ILwwU1gr9cjUreOJGQ8zi/DebqHNHn
         +hBjDQdHFizMebOD1N6uZ09jqkg4MWYFuB5s3EWt4qRfji9NKGLR2JTR2/gPXY4gUxTc
         I4zQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756313; x=1789361113; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G7qjWXGXsxkTDtjG+v9DutrMwqHR45zXHmJ8Wl9xjoo=;
        b=lzdSXix4BYAP099w38LAP8L36e0UPQe5pqVSIVGi8mRY1E9TW5LnETyZOAhGiH12RY
         rIq0bRQXe2k3+Lo7cpCm1rKzL1PWDtf9iXMHkfcoxmJ8FvFCs/5KXUizbnLvX00alkrK
         DwwyTvyOzI7/soFGCfMxcUIzRe7U5Hiy+nkO4yIqk5OFfMc726FNo6lysp9CEzqj991e
         Xcikl5PJr96LyrD3ep+hHShRq0/vayf04V/wb3bhQ5VsdIZq7lD3n+hXre8AnsNx6LJq
         iKvx49Y9eDfrPMMxx5qf9tUAjjYRzCvYn39mu2wz+MHJ72zBuBUYy1OyhhZKlUs6i3rP
         TE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756313; x=1789361113;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G7qjWXGXsxkTDtjG+v9DutrMwqHR45zXHmJ8Wl9xjoo=;
        b=g1vVFCL1xs6fOpzQrKSnhVUzHlt/RiyaOoUNrNm8wRrcHANw+cO583D0kDXaRl4nj3
         M+pAyDMpBC/qYF4mOoLVrHvgY+WibH+E8yYGIEl/573OZcZqGpH/qhFWinEx+Z4eOUe1
         HhHUTb3bWBQbvc3vaHFpt1tLwkSnaAcTY4q5934LbARNzfWvLpD9owIRQMyZjVIVnh69
         LZm6x3o5TW8I6sebB5WT7A5lye0Rb1VqOVhBbPrbAOnkCWf34pyn4moetLPaerimZ7aH
         gqjga6AUafM12N02ec9Cas27JF/GunJTPR0JDvgIShRwwrhLXKOH6q26T5pTN4FSLA2b
         rhdQ==
X-Forwarded-Encrypted: i=1; AKwUvBz3r85WLxprZi/5lpL8lHMgRzOTua38KKXyOyepvn+0FH2UBSvBL0jjxpZIYi1s13M7mdJMn4+L4tRF4A==@lists.linux.dev
X-Gm-Message-State: AFuF++mS5l+n6yNuEmZuduioRrLo6RbBvNlSiT5ooPS+RDT9MauYQgP9
	EhFdmm446lcBbqLMLsURKPKPX9PzpRvPmSJVV8vhBh0DpQ3ELK602cGJ4yDTUPFUBUylDwgMDdj
	vWLIesVMDk1fU/E1vG3BF5AYJC3/pqTU=
X-Gm-Gg: AYBFou2/YAcTNVvoAYO3npMJp9f3TGYrUPhqHgQTIMhYmD2sNeH/6EXvAjUzILwEHGz
	K4RF6o7TcY2CGwTnosxJzmAJ5SAxrODfuHbbE1ntnOm2Mb0c7617gxitYnUafBzxedErjVEYeAC
	YNLzGHLds3saiLOtXtMLFIgVRYy6fM7/VX7GTej2qbyzor6kh7y2cKap48xNOzRNdcTOujiokVz
	R803bs3GR1MxTmVWGKXKwwdBKNDtQKnQRSo+xjty82D446FDb9c59JPy0+lhRa1LwaK0/0s7FLd
	3SA9Oku13Kf8h4h6DtBwMfCKrI6LbATeMM6bT3n/qPLrsQ82H6cQZClmzW3+Dn5Fr//lpR8iZwa
	59JFvning7+WFFUXX1h9jfqwk40I=
X-Received: by 2002:a05:6820:1889:b0:6b1:afc8:3162 with SMTP id
 006d021491bc7-6b6fa4d5f8amr11758130eaf.7.1788756313416; Sun, 06 Sep 2026
 21:45:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260804072630.28745-1-arash.golgol@gmail.com> <CAMxPZkgk4+idrZowJ1z-ddAzaD-hx-NJP+KSj8pUrSfL0HH4aQ@mail.gmail.com>
In-Reply-To: <CAMxPZkgk4+idrZowJ1z-ddAzaD-hx-NJP+KSj8pUrSfL0HH4aQ@mail.gmail.com>
From: arash golgol <arash.golgol@gmail.com>
Date: Mon, 7 Sep 2026 08:15:02 +0330
X-Gm-Features: AcwNN1XGwRoDkNehPDVqSJPI2X738z011aMfgwn8IosFsynC5ZFf-DlnIt-yf84
Message-ID: <CAMxPZkhjurfpPvvymamJqTuia8CtFw1gRyYA4KBwFcQoH5jz3A@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] media: sunxi: Resend active-state conversions
To: Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Cc: yong.deng@magewell.com, paulk@sys-base.io, 
	laurent.pinchart@ideasonboard.com, mchehab@kernel.org, wens@kernel.org, 
	jernej.skrabec@gmail.com, samuel@sholland.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Wed, Aug 12, 2026 at 9:50=E2=80=AFAM arash golgol <arash.golgol@gmail.co=
m> wrote:
>
> Hi Hans,
>
> On Tue, Aug 4, 2026 at 10:57=E2=80=AFAM Arash Golgol <arash.golgol@gmail.=
com> wrote:
> >
> > These three patches convert the sun6i-mipi-csi2, sun8i-a83t-mipi-csi2,
> > and sun6i-csi bridge drivers to use the V4L2 subdev active state API.
> >
> > Each patch has already received review and testing individually in
> > previous postings (see the changelog and links within each patch for
> > that history), but none have been picked up and none currently have
> > a delegate on patchwork. Resending together to make it easier to
> > review and apply as a group.
> >
> > No code changes since the last posted version of each patch.
> >
> > Arash Golgol (3):
> >   media: sun6i-mipi-csi2: Use V4L2 subdev active state
> >   media: sun8i-a83t-mipi-csi2: Use V4L2 subdev active state
> >   media: sun6i-csi: bridge: Use V4L2 subdev active state
> >
> >  .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 155 ++++++++----------
> >  .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
> >  .../sunxi/sun6i-csi/sun6i_csi_capture.c       |  27 ++-
> >  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 107 ++++++------
> >  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h   |   2 -
> >  .../sun8i_a83t_mipi_csi2.c                    | 112 +++++++------
> >  .../sun8i_a83t_mipi_csi2.h                    |   2 -
> >  7 files changed, 194 insertions(+), 220 deletions(-)
> >
> > --
> > 2.34.1
>
> I've been trying to get these patches merged for a while.
> Multiple pings and followups have been sent, but they haven't
> been applied yet. This series is just a collection of my
> individual patches.
>
> All patches have full Reviewed-by/Tested-by coverage from
> Laurent Pinchart and Paul Kocialkowski. Current status of all
> patches are still New in patchwork, without a delegate.
>
> Link: https://patchwork.linuxtv.org/project/linux-media/list/?series=3D28=
738
>
> Given the review is complete, would you be able to pick these
> up, or let me know if something else is blocking them?

Just following up on this series.
Link to series:
https://patchwork.linuxtv.org/project/linux-media/list/?series=3D28738

--=20
Regards,
Arash Golgol
