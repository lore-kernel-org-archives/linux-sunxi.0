Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795753509;
	b=R7+aKcjoL1tivuk1QGiHsizs6qdq9QHlZLf46p4yQizdQX+p9cbMVqMlYOGI0ucdBEoA
	 KLf74HpcwRQOI9faWDY/lzCYZPzaHCsjS6Gh1UnfX2pKn0p35oGTbBGkwuvDQW9EkqtPS
	 u1K4HEduTPVNF6KL2x8YoFXfhtVo7jjCEQz8oLfkSr/iji7mZuXd+yfh09hddy564WDSY
	 jbObqZeK13XvukVCbqtNBAdq5HL3+UGOVyiAdAQYFCNWNlCBweOlNTkp11zvYTVDpmWPG
	 7qsg4WRdNdVrLZmOFgvgbhHn1cHS3BUANUhsRRii2ikPXM42bmnadWBHNLmdXI7FEHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795753509;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=plrZ8vTDv0ic8ndy6Hrgye3r/Sbw023qeByTZDduRDg=;
	b=gGsUqm1I41uNoPFRuRYYdqpG6fSIMfmrDSpMuf/6h+N4W0/FeVxCxrDML/K8Pw/T2yVF
	 BBK2l3n/aAOVCj+avRRBKKI8r56LTxFAmFO3UF9l9AIIPnqdX0dskuHUmr5HmtlLAchIu
	 WXWLlXH5Znv6+w2tV0VpGFtEx3dJqjE81ITQbFCXbLqXxlCmZi93+5K4G3cTZCYs0KcHu
	 AIPwHVoLGLeOZiR/qi2xQyYK9+TaTNVFNfdFHY98Z6ZWJme7x2I4Gr5JoWdBTANNT9TZP
	 +g5hWDld8il/TMICR/340pNk/N2aoVUrFV+6Nzx7bALR2vsJdbHUZ4h5u1wbsoQ22BQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FKC2ecNl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.179
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB9F606A31E
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 04:25:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEB9F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FKC2ecNl
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4e4a4d77e5bso5363464b6e.0
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 20:25:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795753507; cv=none;
        d=google.com; s=arc-20260327;
        b=SsRhKdYgXL6WU7pxPnVSUXGIuJrJcyMZx9d8ttH2Jq4pjRjvNMkIRKbgG3Gw6QyJO9
         6/LjNlL8epnRjb+J+IYp8szx8dQTdWZ0N+ytXFKSIj3SArVJK8DryI53955ixfoEj5RJ
         Ojk+S64iuk2DLQVRDr8Ox/rtK4XsG+91F92byPH3jnJpzrz4ZUG2LfSS8wSVZRM8wLCD
         hF7LMKVICUNkpDmqecVL/Wc6mLiQonDDBC7pbQJpPZogt3xju9klticpDz5yJAXcCGhM
         oq0Q6qSL+egCEZYiKve3wNG5Ub71WGKoPxerpL8RNAZHmUPS3ccUXC9z2Mp688JVBzFW
         cVNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=plrZ8vTDv0ic8ndy6Hrgye3r/Sbw023qeByTZDduRDg=;
        fh=KhJLgi7z1icL4bRK8vKIY6/UzegXhZ478+NG/bP+py8=;
        b=SOEkAlhxVvTWLGroy+dzRYmtvsujt6q9wx+h5TkL5nVn7j8wSAMH8tqKPyt4AXr4g/
         9NH0l9hhgBdiudPPLyUYvsmcxx82Zkf2jXxsJwDCiaKua7fTfGkMtCk18/9SyGyUNJfN
         M/DeKoeOkqwLoqIyF4+91AWPAeIW5hYPusSnrbbEAqpIouoXknHFo8fra6yc2nhyQ24h
         23wx4uluQ65bXDzWskYXCTfb9M50XXgt5ReXCIzM+MZoz9WRnCttj4jDYhLwJP3N8Q/+
         WgTNXd6HYgKyHJONSy7qrNVhV22fWbu/o7xiGZdw+9q4HC2MKuiS2OgVn+eZDeYzODeA
         X6qA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753507; x=1796358307; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=plrZ8vTDv0ic8ndy6Hrgye3r/Sbw023qeByTZDduRDg=;
        b=FKC2ecNlaVo9JJ3MbnEmuALtrJxm29WQVuWfQxcAyuuegt8WKhgKFjrJoPC9HdojQx
         pkNgLC6lBn176UnLAtQ3dCYpfkDD8osRtEeKFnAqaahA1ug1cNwdaRNiFdU0B73IKjyn
         IC9uq3LHMDX0R8KSAeQndRfZfT/pltuyRuKCZZ+e3vXtjqhwXlhQyM1RfH2SPwuy7iB7
         O+eCsAKTvUedH8nXn16wRQJNKoqyiyIqyRrXZPdzwBqBliPFLOUY9l6FxSXKfJiDboRg
         4pHmCos7pSNfZ4L7rCS8Ugwt+bMurtB4gMQpvYD4LURINwzLkwdVRSgE6I+uQQmUyFkB
         uE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753507; x=1796358307;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=plrZ8vTDv0ic8ndy6Hrgye3r/Sbw023qeByTZDduRDg=;
        b=lO+o/suR7auyEot/29N/+ljJ1CcK7Hi4FrShtJJ7+RiZ6r4tU2btx79wVGBPFniFU/
         Rs1ezdrFRjxTvgnSOSiDHOk9ZBQ68MKU0GMXs1zOKo1ixqRYjISkpSOvrUXQmt72voC3
         x5V8Kp9GRTq8/ec3kpjGxm9Cl9vBRX1YYhP4SNKc+mIgtUEMOWRvTmlgniOG4+knPIRt
         c66usrqhMZUlpTQ7J25oq3chOySxN9swGRZkM8EzOAUfzYM5XxH4WSHNbe+kw35DvTcv
         OrJts4b52Aa/G2K6b6PfhzO80BjuDV6ghRORfky8Tw9FRUNgHaakrDbPngDPVoQVEtOk
         gK4Q==
X-Forwarded-Encrypted: i=1; AL+hErHTJ7VNGnKthztDWhaKNFcJwDU22R+Wpg+LG17lqFIXIj59aFpRDjRMvYZI6gZD5TI1VugUNPrUHanHxA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+6sXV+QpGwGERe+x2XERz8aaiC1ulZvLPAQ6heBZLapb9EQnTj
	RHrdtrck/C5n565xut8pG8Vu1u0GDJ18x5lEecQkA3RfOy1vkNh3vzPtEupl5KH2sSq53DaWAlH
	IQPE5WSDO8FIa9zJRT/kRLtrMK7yD7WU=
X-Gm-Gg: AZFdTZeZtooexPTvECjeQep7wdSSJTqqIrdLAyqBg8sT03M2Xdr4S4eVLCpIAq2/qEM
	9xKKdTTHmfWyw4j+hz37w6yvNGdaQ12w38wKo+HnZ7flK3PVKxjvz9Hlk/ajpFV8vk6tNLBmoLB
	4usKF83dB8WBcWVWD7JHmTX/i+PimvXSGgiXj4zFD7DryDtqX/AMaTWzbD08J9DcdcvIde530Oi
	DqW2sGd0VHWvNvg+BWn0hkoh3uiSr2fxvn5asbMdkIh3uvFiWra3qz3cw8sbN47KmBoSsn2BC7H
	cg5eIbJCf3T8v6f7ltIZ+lRmUa/+Z52SKIh1IyunEvteKPcY/Oa5TplihypBTZX8Miv+QDD0iN6
	aHNg/Dl0sjsryj5SfGW4Rc7x80YOGGreBmE4KU84lu0qxHczr9KcL6dlXG1Su9TYTvsN9Y3IkEk
	oyJlrqaYB2X/6gVlDQmMKtGI8c
X-Received: by 2002:a05:6808:2383:b0:572:f8ec:5340 with SMTP id
 5614622812f47-5797dd97e12mr17446004b6e.40.1795753507571; Thu, 26 Nov 2026
 20:25:07 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261016113846.8602-1-arash.golgol@gmail.com> <CAMxPZkhRKB8uGL3L4K43aU4pqH+FdZdB829yaw6WDF-h4RW7oA@mail.gmail.com>
In-Reply-To: <CAMxPZkhRKB8uGL3L4K43aU4pqH+FdZdB829yaw6WDF-h4RW7oA@mail.gmail.com>
From: arash golgol <arash.golgol@gmail.com>
Date: Fri, 27 Nov 2026 07:54:38 +0330
X-Gm-Features: Aa3M54oshEKj1zUWUb4kWDxcGN9dYz2vo17SWP_9ajtYh-JXJ1CIiIPrqckXMbs
Message-ID: <CAMxPZkjXrHYT8DNwGCiFDfxRYxpxu1VhM2m0MrdTjG2_LPJFBg@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] media: sun6i-csi: Improve capture and bridge
To: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Cc: yong.deng@magewell.com, paulk@sys-base.io, mchehab@kernel.org, 
	wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, 
	laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 6, 2026 at 4:24=E2=80=AFPM arash golgol <arash.golgol@gmail.com=
> wrote:
>
> Hi,
>
> On Fri, Oct 16, 2026 at 3:08=E2=80=AFPM Arash Golgol <arash.golgol@gmail.=
com> wrote:
> >
> > Hi,
> >
> > This series improves sun6i-csi capture and bridge.
> >
> > Patch 1 fixes sun6i_csi_capture_format_prepare() to align both width
> > and height to 16 for NV12_16L16, as its 16x16 tiles require.
> >
> > Patch 2 adds vidioc_enum_framesizes() to sun6i-csi-capture, using the
> > same alignment.
> >
> > Patch 3 removes duplicated mbus codes from sun6i-csi-bridge. It was
> > posted earlier and carries Paul's Reviewed-by.
> > Link: https://patchwork.linuxtv.org/project/linux-media/patch/202605271=
24552.33815-1-arash.golgol@gmail.com/
> >
> > Tested on LicheePi Zero Dock (Allwinner V3s) with:
> >   ov5647 -> sun6i-mipi-csi2 -> sun6i-csi-bridge -> sun6i-csi-capture
> >
> > As ov5647 only outputs Bayer, streaming HM12/NV12 is not possible on
> > this setup, so I did not test real streaming. I checked that
> > v4l2-ctl --try-fmt-video, --set-fmt-video, --get-fmt-video and
> > --list-framesizes report the expected sizes for HM12 (16 aligned) and
> > NV12 (2 aligned).
> >
> > Arash Golgol (3):
> >   media: sun6i-csi: capture: Align size to 16 for NV12_16L16
> >   media: sun6i-csi: capture: Add enum_framesizes support
> >   media: sun6i-csi: bridge: Remove duplicate mbus format entries
> >
> >  .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 12 -----
> >  .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 45 ++++++++++++++++---
> >  2 files changed, 39 insertions(+), 18 deletions(-)
> >
> > --
> > 2.34.1
>
> Just following up on this series.
> Link: https://patchwork.linuxtv.org/project/linux-media/list/?series=3D32=
161

I appreciate your feedback on this series.
Link: https://patchwork.linuxtv.org/project/linux-media/list/?series=3D3216=
1

--=20
Regards,
Arash Golgol
