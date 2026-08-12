Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6517833BBBD
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Aug 2026 06:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786515661; cv=pass; b=vDam3D4wwDsQAkZqcD7Ebb/cn//nxa7yMmpilH2IU1NDXZH2FcxPdBruh27ND1pwWPxtSIBx3AZPSgz977yl/3EbLRZGIdWwB/994z8lJgJqS9tny9KIb/oeL0Vxtarx9QMLt3GOsTClVqk6n698bLP1/4knKj/ZrILvb5kFryY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786515661; c=relaxed/simple;
	bh=tlEalvw38MRIzcu/FK5X9aIVn/heQzK+BENu1kxTBSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pshxlfL2JC5t4slhRNGt4lEWXsIF79BaDIvtl/352bQwe1aWiJV4VaS4TCFZBx+Fw40fkLiGXuqicUeb8PFyMok7fy0+NkHoxiveywxxQnkGo1iwYNNHeNonZBTeb9qJ7ziCKq242dHBnsT0oTDuJEaOzP5HmvXtY/zbaIW69Kg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BVV0nEpq; arc=pass smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BVV0nEpq"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-495b27007d0so432029b6e.1
        for <linux-sunxi@lists.linux.dev>; Tue, 11 Aug 2026 23:20:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786515657; cv=none;
        d=google.com; s=arc-20260327;
        b=jLBKIeU6KpwkT81sWpxO0hm9ma+aaPsJvbaXHKasq7ct/iNVBLrPtKzxLpAK2OMLY1
         OUjSqCXlzlgminy58oiCIJgRjE/wmATjrxDCbZY4zYjLpDYGtRnNMgRJ06wkm1Ni5E0/
         uwHrjzQBTKRS2m4aYF7EJxFoTPgG2f7qhPtMyao/ISxTNzos7DwNwZPfCgBeRS5xlf9B
         pbwmW4j5mcF4udCwSdVp6w611CxeNnJsvZn0135gkwCd/Hl6zN/T74U5sVg0TzQfD+R+
         pM53nkLEXSjsT4wR5qBSjw0worC4CFHcscQqm2G+bhgYNuArdvVzuyK5vvuwiZqtJlwD
         A/oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cMPYqH2rSsPZKaiB6xyd/bPub1tzYs85s7i3sDSGdS4=;
        fh=X52bolyj2Fd0GZhlkBbrRSY9detrMNu/Sm8nK0jypzE=;
        b=WE0iSYaMWEIaQUscz1Exh5ADLZ7+D+lfzEZL6sONKVU4Mp70juHl8pEpkvmBSyDEjy
         NgtMR7Za2veDLVwPalbAfh3l4B3RX/+QrL2Jjt+JsihxxDMNWiD6dDamv9E1zF0P54U/
         RC+nXhYUP5Kjo+1cbDy9kqLwEuj9C2eSGRbaYR7woYcAEwwtTm/8YuNgoNYctvAIKjA1
         d5HK8HlhdmGVU6ES4Xb37r7WEdVOUevh1r2+rgoLa135tw2Qkb3b+08PrztD6iq4LmnE
         EWxS4p6+7kydxJdhI/CWButniiqXB1M/JizwXNBATQu0Icp4hnyzB24jayX8d0BNImD4
         TLpg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786515657; x=1787120457; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cMPYqH2rSsPZKaiB6xyd/bPub1tzYs85s7i3sDSGdS4=;
        b=BVV0nEpq0I2el+O6Si3SBgk31Y7xkNwA5CNwzshy7Zx2zU/aw6fJn3u2o9b0dEy2rl
         xZgWSe0ib72H4odUX7tVBQf25bhHJSzevlCAA0S6iZsUTRhXlnBtz8MTEpUgv6Xd30Ng
         T7KfRPS7DdrCz2RM2aL5anZyXGJPJVWc9pd4jT5yT7uodoqm7gwxpwFgFuNLw7DvmSDo
         NILgvkENXIv5g/h2Rq8AOdOkyC+BVuT9Wki8im7XwE4qRXAxEgh5tnnoWg04IbVPUzgU
         BO+5vmSOCyngog3K3HTEfqdUf7D2cOAHhFsHT04vYt/ILzrcyPj4Z8LH0TLi3uDO6Ghu
         Lf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786515657; x=1787120457;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cMPYqH2rSsPZKaiB6xyd/bPub1tzYs85s7i3sDSGdS4=;
        b=IkGdM9yVTQXbBrJvNcfqDF4nO/k7pnA4ceuBqORNIFBtg6ektwNv9DR62T8gwFsquF
         pgjMT7oj5vEiQ4QQs7zt9XocCbWygFOX663811BUMehRkvxzX6/BvR/NQe3JwD6VKguG
         A1orFpQNMEKBpXOMCzoVxsInMTLzoYzCGQG666ITSvd1TeAi9onrMttrZHfkbTKxvu7A
         VmEh/KRxoZvlUWgiXDCX6Mu7pfbqlXB8oPqRecMsqFpqqxcwuyy1Y4lQC6HfdF/tAeKE
         Q+V36Uhli4z16MQkTsc6C3S0tCR8RNLAXaqqZmNA0KY+TnvF6CBhJaT7g4jyvxiJEXwL
         iw0A==
X-Forwarded-Encrypted: i=1; AHgh+RpYQ9zE8tLclBhhDYmyZZ6EPXgDuXG+X7n1gQOrNP7rDWkvB3Iz9ywWzww6wrkxe+bHJpx/U+FqPOsTRA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw36MiSPCcQg730DpZ8jrn/zhVzGlYiID++1Zc0G4/o2jVbjENj
	UrE5LA0wobAe3pzp4Kh8flMTrvce+eDV70I45beuRRG55h+PDQbKEQCkutVCpMCbGERIcFS9n4r
	QZlm8Zj1Uuv65P3cHD6OAGMYx1PY7MRo=
X-Gm-Gg: AR+sD13kNgYkCkK6G6LPeSiWMeXtGa/ECWWAAtIRflXtBqglKLBAIfG3STXOgnaV6y9
	GQc6ofFC0CQPmBQRl33Kgq68Ahx2A3f53G2ZUut3kmsRFxM8C4e53nDpCzoux6F8TnxwYr4uGZQ
	LJ/6285ZbcEsjLtukFAg/Q0ZVlM9WB1NKsmGkAZITlj1wBFB7IHHx7vH98ELpiP4UEuxZYpfLsL
	fREgMOVnKHUo67DzI0OTUDNAFQXgxlCyGHhEdtmJo/z6h6uU+T+OBkXwStHn4pZ5xdbDKHRw8/g
	MFcrBMNjE0lz4jamqOSLqVOiVgGdpucBdkQi0Nukn8Xj36vrD+ny8y+ttRBQqprhhZS9HoocPpK
	TzuDJHSx8lkHA8mVThiTYUBGfVmTF
X-Received: by 2002:a05:6808:c187:b0:495:f223:bcdb with SMTP id
 5614622812f47-4b21061c5damr2531855b6e.0.1786515657026; Tue, 11 Aug 2026
 23:20:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260804072630.28745-1-arash.golgol@gmail.com>
In-Reply-To: <20260804072630.28745-1-arash.golgol@gmail.com>
From: arash golgol <arash.golgol@gmail.com>
Date: Wed, 12 Aug 2026 09:50:22 +0330
X-Gm-Features: AUfX_mzlabjmvWrDZZ1bt6DkpShw2PYSh2yJEy72hNkw53lZIQYbsjEUo5mnP90
Message-ID: <CAMxPZkgk4+idrZowJ1z-ddAzaD-hx-NJP+KSj8pUrSfL0HH4aQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] media: sunxi: Resend active-state conversions
To: Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Cc: yong.deng@magewell.com, paulk@sys-base.io, 
	laurent.pinchart@ideasonboard.com, mchehab@kernel.org, wens@kernel.org, 
	jernej.skrabec@gmail.com, samuel@sholland.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Tue, Aug 4, 2026 at 10:57=E2=80=AFAM Arash Golgol <arash.golgol@gmail.co=
m> wrote:
>
> These three patches convert the sun6i-mipi-csi2, sun8i-a83t-mipi-csi2,
> and sun6i-csi bridge drivers to use the V4L2 subdev active state API.
>
> Each patch has already received review and testing individually in
> previous postings (see the changelog and links within each patch for
> that history), but none have been picked up and none currently have
> a delegate on patchwork. Resending together to make it easier to
> review and apply as a group.
>
> No code changes since the last posted version of each patch.
>
> Arash Golgol (3):
>   media: sun6i-mipi-csi2: Use V4L2 subdev active state
>   media: sun8i-a83t-mipi-csi2: Use V4L2 subdev active state
>   media: sun6i-csi: bridge: Use V4L2 subdev active state
>
>  .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 155 ++++++++----------
>  .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
>  .../sunxi/sun6i-csi/sun6i_csi_capture.c       |  27 ++-
>  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 107 ++++++------
>  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h   |   2 -
>  .../sun8i_a83t_mipi_csi2.c                    | 112 +++++++------
>  .../sun8i_a83t_mipi_csi2.h                    |   2 -
>  7 files changed, 194 insertions(+), 220 deletions(-)
>
> --
> 2.34.1

I've been trying to get these patches merged for a while.
Multiple pings and followups have been sent, but they haven't
been applied yet. This series is just a collection of my
individual patches.

All patches have full Reviewed-by/Tested-by coverage from
Laurent Pinchart and Paul Kocialkowski. Current status of all
patches are still New in patchwork, without a delegate.

Link: https://patchwork.linuxtv.org/project/linux-media/list/?series=3D2873=
8

Given the review is complete, would you be able to pick these
up, or let me know if something else is blocking them?

--=20
Regards,
Arash Golgol
