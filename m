Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232D83A962E
	for <linux-sunxi@lists.linux.dev>; Sat, 11 Jul 2026 12:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783772825; cv=pass; b=nsFNjU+VmQfuO150ObWF0w1wRNFk0Ru+b+w2foOvRtVB5bQG7DdCYvJUU8dSqEDF/0T6bjcGTV/In28j2pWIArCJm4cw0T+IFMjXzpWTIN9ZkbbkSDc7EJrfvIeUBWCVXXrqX6mJrBR4o95uILwJde9urDrCSWA6KNz5kvajq+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783772825; c=relaxed/simple;
	bh=lKkBOFw65FVpqI9S/5kUTJVCqXb7nC0BIpdVR7JJA2U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QYJKGqBuSy9dtHUeuJpZBiYABLEYD4MLoazHfg90f6Um1EGfBRNHGniG6y8AW8H5qV+44iQQkx/Rrb1/Rwg0CMPtsRTKugN0PuMAqwlwZ+lxuKPCfmDzl3hAMUk0I0M9Gpqlc0Qz54221lHgQvEZX4k5Xt7m72WbkfqE9+lSyrI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b6eOiZL7; arc=pass smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b6eOiZL7"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-491bc1d4e6bso1235011b6e.0
        for <linux-sunxi@lists.linux.dev>; Sat, 11 Jul 2026 05:27:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783772823; cv=none;
        d=google.com; s=arc-20260327;
        b=Y5Vgwl1usMQr03AubDOk7y5F+mE575JNEq8uaYu2wLl+2lfOm1ehameHcUa+0cpfr3
         knF5++IPaY5nsKVhhn9V0OfC8XOyF5wj0kdyMIUCJiOGo7sqeG5oQkshtyqcjDNj9b15
         9NUFtzU/QoneEImeBVO2OzG1W/1fUHREHlDQq0lZQhS6HS163khyQEVQ7L0O1NztIq0i
         oGNq5z838xMc2PeZdMpE4+UaG0CjIrw5YbVNiS2FsJ1JPFLmtd2poY9Qa9Q87kKxenVV
         k2BYqhOHDU9UrUBAbwx0fecYC7GTOo5aWUyXASjvIT/4SHJrHnS4aGKibiaOqeGjT7dG
         pSxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hEwUMLZxq0p2ok1ig4UlS+jtAFMxWsAuPxBBLyv10o4=;
        fh=8qO2g0Pq6WGktrqIuVZgrDifs+CLhGPwwf+LkPsJbdw=;
        b=kY16dNaU9bUb25eHJTeJ+WRqQS4VUpMwueMzNtDqZriDWORlHxfqfK4lMyehTg7UQo
         nM47d7HtgIJfLTpa15bhIzruiyM7EC8XjT+wgRt7fRRxOVOHbeoZryvfSU16/7uN2pHF
         C3RjQD1WThOeJF4NG4cKF3BbwBJUOog6nKlK2s9bjQ/ag4uqA37Pr1ihO5yYHCwBYUpy
         8VLzwvagagZbjbk5n4lgOb2v9gSGEzhs2M5RwXk4kHiokM4RUoGDpun2i/OA8ltmoe0s
         YLl5b5VCm1vz20zx/UgG1XkLmhtxOCVnS24gQH9NgBRRoxTw/MUett/rX4CU3rMNvOhi
         kzfA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783772823; x=1784377623; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hEwUMLZxq0p2ok1ig4UlS+jtAFMxWsAuPxBBLyv10o4=;
        b=b6eOiZL7kR3YM80+oNnDgUsYPFggh+8+hc3rlSDySQ8ywFrLQRbpc8XS8RzU6bix3p
         6DY5KQf0LzY4fB4J1QkJLnHabtTtOK0fLm0XD1aqwnCQPUR9dR/DLEmNFl38JHttcKLy
         eMcJF5qAvL8RQhpYrTOrAfxgfymb+sJbFCZl3YsCF9P2vmOBY3rha+DCKquec14AmaTo
         AC3cpQxjmPhfx40DKORCUTRpSh6uCiptYZiza+2d2rAkNZxgoj1rRTN69+tNeGQHmR6T
         DpQnsKfM61P+FR1Ql1KFPt0yc1/INMmzoCOfqbRUTvE+BErt739yBbRQbX05kjSEY8gJ
         81Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783772823; x=1784377623;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hEwUMLZxq0p2ok1ig4UlS+jtAFMxWsAuPxBBLyv10o4=;
        b=GHXybNxxELtJKxCGlbADWSieKysAxjhemgVCNnRVIPWwZWmA+bYCGRwZnM8MACRdYv
         cSlmMpGSNMZRUR4uH1UJWLu4hx3ZLth5Q5vjhsLAS/cIyi14qpHqtAlr8HPlP2jxJ+QR
         XfLnI23dA+pOD9Op/NpJbpCBPn4jCXkOEVROdB26p/W60FeqS39eVRF1eqoNZGSYjLMm
         gFcN+F94Y9p87hplIifzPAkvbj3531M+kGEjQosW07Ta0wIPoEOw9ynboEC9ePb1hOEb
         KiAZNQcV9A9U6qKzZMKokgECcYdZ23nNMAXab4M8bytZvu/G9S5WodO7US3UOMsyinVS
         JMRA==
X-Forwarded-Encrypted: i=1; AFNElJ+MYiCmXHI0JdveaW1x1WfBs4701d1GNg6dLOGaGYhYDiU7w99j/9uPYt3K6h50wtXr+WXTWqQOckfBGw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzpuAaM7v+77N9D2AmIhgpqy+RZXSrE2nkFpPFkH2tE2nwD0WoQ
	/BwNZAD3O8TEju16mcG6ujBXFIe23salz+803IoKoQN+SNI2DP+kPBYNT4XZ+kwd/TSQExan1kz
	1xCCK3bTIsQr8Or/7wcfa1Rvi9WqkSxM=
X-Gm-Gg: AfdE7cmUEoIGPUqW5Mchtn1vh2rs8FTPWBLaQeYPEXk56EJHTTJQp05KBtI9TBfYsWh
	NngHrlwgFIuAUe2pD+hJmN97QNdd040/rwONWTs0JZiYg7pOmIXFghgwRTbzYZqU+LVv8+MQHsF
	rBZfxjbTmSv2s2pxyJx7JfEE9NiuO+LwKkqQicm9UBst7/P2C6rd0+Xm94Ew5sgRX8shTLlYCp8
	2kPLTVsNLCzi3ibrvlvg8wBed0eqNHeXVNcQ9O7G+IY0mV8xsi+k06P/yxsyiJN+MgOtV00hRZI
	484FD58ICCnMhl6FyQBRX5wGJ8trjbgb3bd3saidmx6yS25IU+wNkkXNxg==
X-Received: by 2002:a05:6808:4484:b0:4a3:5294:43d3 with SMTP id
 5614622812f47-4a42ac1c2e8mr1775095b6e.3.1783772823070; Sat, 11 Jul 2026
 05:27:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260527124552.33815-1-arash.golgol@gmail.com> <ahfxskMC340jUtbQ@shepard>
In-Reply-To: <ahfxskMC340jUtbQ@shepard>
From: arash golgol <arash.golgol@gmail.com>
Date: Sat, 11 Jul 2026 15:56:51 +0330
X-Gm-Features: AUfX_mxN86zZBxPKHCNMJW9RhtruJcbvwihBjdQU--ZAFLpMa1mHyqWXuxF1LQ0
Message-ID: <CAMxPZkgtu1_H=UQ6pRg0mtj=O4bq7gpEuTg-wmEtVAOP12qUJg@mail.gmail.com>
Subject: Re: [PATCH] media: sun6i-csi: bridge: Remove duplicate mbus format entries
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, yong.deng@magewell.com, mchehab@kernel.org, 
	wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, 
	laurent.pinchart@ideasonboard.com, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, May 28, 2026 at 11:11=E2=80=AFAM Paul Kocialkowski <paulk@sys-base.=
io> wrote:
>
> Hi Arash,
>
> On Wed 27 May 26, 16:15, Arash Golgol wrote:
> > The driver reports MEDIA_BUS_FMT_UYVY8_2X8 and
> > MEDIA_BUS_FMT_UYVY8_1X16 twice when enumerating supported media bus
> > codes.
> >
> > Remove the duplicated entries from sun6i_csi_bridge_formats[].
>
> Looks good to me, thanks for taking care of this!
>
> > Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
>
> Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>

I'd like to gently follow up on this patch.

> All the best,
>
> Paul
>
> > ---
> >  .../platform/sunxi/sun6i-csi/sun6i_csi_bridge.c      | 12 ------------
> >  1 file changed, 12 deletions(-)
> >
> > diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c =
b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> > index d006d9dd0170..0bec0cd7620e 100644
> > --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> > +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> > @@ -113,12 +113,6 @@ static const struct sun6i_csi_bridge_format sun6i_=
csi_bridge_formats[] =3D {
> >               .input_yuv_seq          =3D SUN6I_CSI_INPUT_YUV_SEQ_YVYU,
> >               .input_yuv_seq_invert   =3D SUN6I_CSI_INPUT_YUV_SEQ_YUYV,
> >       },
> > -     {
> > -             .mbus_code              =3D MEDIA_BUS_FMT_UYVY8_2X8,
> > -             .input_format           =3D SUN6I_CSI_INPUT_FMT_YUV422,
> > -             .input_yuv_seq          =3D SUN6I_CSI_INPUT_YUV_SEQ_UYVY,
> > -             .input_yuv_seq_invert   =3D SUN6I_CSI_INPUT_YUV_SEQ_VYUY,
> > -     },
> >       {
> >               .mbus_code              =3D MEDIA_BUS_FMT_VYUY8_2X8,
> >               .input_format           =3D SUN6I_CSI_INPUT_FMT_YUV422,
> > @@ -143,12 +137,6 @@ static const struct sun6i_csi_bridge_format sun6i_=
csi_bridge_formats[] =3D {
> >               .input_yuv_seq          =3D SUN6I_CSI_INPUT_YUV_SEQ_YVYU,
> >               .input_yuv_seq_invert   =3D SUN6I_CSI_INPUT_YUV_SEQ_YUYV,
> >       },
> > -     {
> > -             .mbus_code              =3D MEDIA_BUS_FMT_UYVY8_1X16,
> > -             .input_format           =3D SUN6I_CSI_INPUT_FMT_YUV422,
> > -             .input_yuv_seq          =3D SUN6I_CSI_INPUT_YUV_SEQ_UYVY,
> > -             .input_yuv_seq_invert   =3D SUN6I_CSI_INPUT_YUV_SEQ_VYUY,
> > -     },
> >       {
> >               .mbus_code              =3D MEDIA_BUS_FMT_VYUY8_1X16,
> >               .input_format           =3D SUN6I_CSI_INPUT_FMT_YUV422,
> > --
> > 2.34.1
> >
>
> --
> Paul Kocialkowski,
>
> Independent contractor - sys-base - https://www.sys-base.io/
> Free software developer - https://www.paulk.fr/
>
> Expert in multimedia, graphics and embedded hardware support with Linux.

--=20
Regards,
Arash Golgol
