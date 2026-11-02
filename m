Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793640928;
	b=kABSpAfoihRuNaB16o0vKEoF3Q5JrUsHU53OKoWJzU3aPUXkzqR5EQjHGO9gDhNaA6hP
	 gKMe+CI4NrRWaxXahLYj5itmvcXjUf6xa9uQ2F4aX6vDsvRzEv0HXKFVPOABnigMsKV27
	 4iMFiS1O/OuiCBOYy8DBC8o4WS5O2cMyYnZ0k31RVEMFdJeAGw5ePZGAy1u1MR2sloWR3
	 +jPnFSE1mGSp2dQuiRinCxbuyjKd+pFIkRFUoLZHZ4a51ymcddZHBHqxmIxf6cfGQ6EcQ
	 wHsDvUN/ku7inX93W/cRbQCCKwx33FlnQnwOCn2fIQK2ijQu2NE3nNCL41wKBbVMsFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793640928;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=P/cubmVZ8qcsXiKdKm+cADTgEwpGZd+2OQ3xGUkWUWU=;
	b=PATOc1S93jz3rC+xhtM6UR3cGGRDCmbNjoLlBshgOC7DCb59WI6pP1rfpXbR58AqzuAN
	 Wd/wrXlRev4RwTb9TqsnQtyekjYT0RXbmA9DEif/RNOS9hSo4jihPcGkyyunYO9v+ccri
	 rh8VdIDivo+3zRpBlwPcATdP4vXtV6q8J4Z7s9U2+HhsjhFhcG6qg1L/Z4QZZKR7C0u0U
	 Q2FhL7RVjzY9MpXI6SxvLU+FdHmLKKDMpx/1CCknCh4t8qbga/MTSnSwPTGjzro00RVrF
	 ozgjyNQUECMwVULVrabNMRHUgHvAFz7IhoC9bUZ7WCSTtfi0BB7ziwFftziGcoiVosw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mt4Kgmdh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA957606A5A3
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Nov 2026 17:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mt4Kgmdh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 410391F00A18;
	Mon,  2 Nov 2026 17:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793640927;
	bh=P/cubmVZ8qcsXiKdKm+cADTgEwpGZd+2OQ3xGUkWUWU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Mt4Kgmdh82NVTRlws4YHu3eLSw3mS/168Qdv8hUY6j2Z32lHX9ZwvdglTMNSO5dpr
	 oeDaYchUWP6l8fMuEmT32KDZvMXzPBoPX4FJ1Wwu3qd/O5vYpt+TSnvE90cyQr2LSZ
	 oA0jdgjNOhrZlC128G3eL8Iu7a5VCXyZwS4Qb+2XlPkwTe9ayKMTAEFCTq2nLNr/W3
	 WDMZeqK380Qs61+R/y/5+R8YHKkdvZIBxrSsQ3N4NMcVT/o5TR/sCltqztMUZ999lS
	 tBZZJoLiK8ML+M1vDld8bGCd43xV3eOTOPIi0Z502oE59ZSp6V6XcrRz1aABHXKexE
	 W/PMJXYJA4dQw==
Message-ID: <sashiko-outbox-193845@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/10] staging: media: cedrus: h264: mark long-term
 references in the frame info
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jernej Skrabec" <jernej.skrabec@gmail.com>
Cc: linux-sunxi@lists.linux.dev, media-ci@linuxtv.org
In-Reply-To: <20261102170303.1973892-4-jernej.skrabec@gmail.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
 <20261102170303.1973892-4-jernej.skrabec@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 17:35:26 +0000
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] media: cedrus: h264: lost long-term flag in cedrus_write_frame_l=
ist()
--

commit 2185109fe892e8452d1ff6c43246f08d7ba7e368
Author: Jernej Skrabec <jernej.skrabec@gmail.com>

staging: media: cedrus: h264: mark long-term references in the frame info

This commit updates cedrus_fill_ref_pic() and cedrus_write_frame_list() to
populate the top and bottom field reference type bits in the H.264 SRAM
framebuffer list entry so that long-term reference pictures are marked as
long-term instead of short-term.

> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h264.c
> index 892193c12b2f3..a716955655f7d 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c

[ ... ]

> @@ -128,6 +136,7 @@ static int cedrus_write_frame_list(struct cedrus_ctx =
*ctx,
>  		cedrus_fill_ref_pic(ctx, cedrus_buf,
>  				    dpb->top_field_order_cnt,
>  				    dpb->bottom_field_order_cnt,
> +				    dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM,
>  				    &pic_list[position]);
>  	}
> =20
> @@ -174,6 +183,7 @@ static int cedrus_write_frame_list(struct cedrus_ctx =
*ctx,
>  	cedrus_fill_ref_pic(ctx, output_buf,
>  			    decode->top_field_order_cnt,
>  			    decode->bottom_field_order_cnt,
> +			    false,
>  			    &pic_list[position]);

[Severity: Medium]
When decoding the second field of an interlaced complementary field pair in=
to
the same capture buffer (run->dst), the already-decoded first field is pres=
ent
in decode->dpb[] with a matching timestamp. In cedrus_write_frame_list(), t=
he
DPB loop skips calling cedrus_fill_ref_pic() for that entry:

	for (i =3D 0; i < ARRAY_SIZE(decode->dpb); i++) {
		...
		if (run->dst->vb2_buf.timestamp =3D=3D dpb->reference_ts) {
			output =3D position;
			continue;
		}

and instead populates pic_list[position] via the cedrus_fill_ref_pic() call=
 on
output_buf above with long_term hardcoded to false.

If the first field was marked as a long-term reference (for example, an IDR
field with long_term_reference_flag set or via MMCO), its DPB entry has
V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM set and the second field can reference it
at pic_list[position].

By passing false here instead of preserving the DPB entry's
V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM flag when output >=3D 0, won't
pic_list[position] be programmed as VE_H264_FRAME_INFO_REF_TYPE_SHORT_TERM
instead of VE_H264_FRAME_INFO_REF_TYPE_LONG_TERM when decoding the second
field?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102170303.1973=
892-1-jernej.skrabec@gmail.com?part=3D3
