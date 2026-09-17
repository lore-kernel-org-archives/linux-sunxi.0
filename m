Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560DC596502
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Sep 2026 14:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789655406; cv=pass; b=CfhOXCQlJruhbPIcy7vl3iEMi4lA9DNNzau8HkcRFCqzgWByW/DkT3yjTp28QUedon4FaCXygq+piEczESchDnqT2EheCGmMgU/+q6+O2O7SKVsJHhf36NXbv6SaSmGYGg6aWHgjYKDbE1VsQMvpA4XOqHCYUscVDeFYGb7hLeE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789655406; c=relaxed/simple;
	bh=tO89l4GyjLHI75AA2qmTYizFB7q8DyYaOKJhG9upfFA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gUsYhRuM7LlOG22X2G05pPoXhgGvdnRcXz/nueoyccQcwsPXKncVKZsUTSgE3mXqB+F/mN5yBx3Kse3MFtYE6igGikMVh+yeA7IbNjp+Z1ncZL0t8CmWSFIDVYuv2ikxQVy4WbQ5vKkrFhwjamYyK8DTArByge9xNR2GQQyiXzM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=odihMUPE; arc=pass smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="odihMUPE"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4b1ba286f6bso443164b6e.1
        for <linux-sunxi@lists.linux.dev>; Thu, 17 Sep 2026 07:29:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789655396; cv=none;
        d=google.com; s=arc-20260327;
        b=WHRbh1PlzRGMfTCi/pmRMFJexNUFzsUcLEV23vRSmoU/BELNEjf/4bi6mDpLpG2VsH
         sllz0NNEuwEFwyXufro7jZwJQqMZwbeE8V0JPPceqM8SiGoykqefiCKQxJDAxcD/2hVz
         vNZM0AfEsCdjzQtvtvWQoenhg6THgFlfcF5/sxSMcyLdkldSUD0V33UQglpQKBL5jlRJ
         nSWrcqS5AZO6es571G2+hlg5Xcr1YIpVSX2ZnZpzMg8xgWWmOWCYy0gCHYhl1Yjllc26
         +VgN5B00rp8dn+myRKpQY1RL8gLFu3fnCd6PDZe1UxHXLZmTX9LhZD50kA0jHRZ1a4Rx
         R1Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kbF8DJsBNb/vjvqxltfvOVH4E7JK9oJSWeeIE1KCFZY=;
        fh=TsfCAfeYG+KTHxvl89u8FFSMWypbegpyHhe+9cO/4iE=;
        b=Nqkm+iyywkr6c6+44HE/FtTlxsM116fvGuBMTNKxTz2qTVlluGuqsYe8jghrXVvRvc
         6QlcLHnoj3qE4Guim3mMnkCRinANJLRGnz3fUydNbnta81HI/MS2UZSN+tMsoqPlH8P/
         WySczDLzOPPnksgRUip3S/cJ8sHx54p6vtssCmSb/9WzBaXyWlnTsNF3H79/tqR4MER5
         kyPVtVXHZSskRhmumktmL9G4+ea1MISibBZjPSd+2zixG60ER2r7r2jPVVtYU3fmWZGu
         4LtNLOBAaqUSaQQqIf3HIMI4Eq7Kdu/Z1P9rljA5x9FNyRjA28Z/NZzuMlh4M1ucdIKH
         yc/w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789655396; x=1790260196; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kbF8DJsBNb/vjvqxltfvOVH4E7JK9oJSWeeIE1KCFZY=;
        b=odihMUPEfIbmbA6A+P/Sia62EnEuMRBikRoHvjv6kmmby7JRXn1rVfL8Es/P3MokZo
         fqJU+Ms/Iuqde1xUXTs7dQsYZpBI6uvPvgM1gk0iq4m4VmD9WC/8lIiDMM6BRPBz3X6W
         SMNXiK9kTvz35flua+x9BPmUio9TuXRpz79X6c1s7zKQOBUsCLIyhSSL/B1BjNgVOiAV
         f1aLOWXlhbyrBUxx9xlSWrfSEle/gNijI+O541cY2fuM2KpId6dhOpIGb8f+JlvxstLz
         yg9ubOUOtMnGbQeRWE6F2qwzxSdn+7hALZb2HhxyTwOytc4zWIxS/uO5LPZCql/8uiau
         ZkoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789655396; x=1790260196;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kbF8DJsBNb/vjvqxltfvOVH4E7JK9oJSWeeIE1KCFZY=;
        b=dw3HCoKTKSw+dtvSHDrEtxQDwQPtf3X+12WCbkwnPvKmpA7Ui8XvoLSr6CD1qi4fSk
         OWmZ1VobVcf6XRHD/Lz4n7iyv9wXXb4DoSAoe2OTVtG5ZdM6VkzKk+pwk7KgjlYaD09+
         zwDxOWFiGjkNN2YAO1piBAwtQbAw0OuBruCp0/5y+v59JFh8L97EJZMi5FnIt7M0if+i
         8o3GxhJP2ya8bVuLy184jcUPAprSKX3p9iWtmMJvbsXZzxJL4JxbeqViFWsTDInYuqXg
         fbL7mar3x1NIusDnoCtuHb3VHNfdxpgG8RRaiiNMUxMrBAWRorQQ9O2sO+xrjTOMxbK1
         Z/bw==
X-Forwarded-Encrypted: i=1; AKwUvBzOH7euN0THoJPVuQ6mr9gz7StKZlvMy/+HkxFv+Ejb4R9QEwVp3rEbPs72LznjnaiR8+jz2axCo53oXA==@lists.linux.dev
X-Gm-Message-State: AFuF++l0AAVQo7RKdij5WmRpuI+gOpiDvx3Ym9JdjQvICUma895OH11m
	Hn/+fPkj2rIv+hghPRPBH/JSmAm03dKNe/MSPlqzhV4OUhxXY1o+oPlqqQO6qyvBr2r1yBEhCjO
	HW6omXVBd0lF98QyJ35jNfA3XX4QeFy0=
X-Gm-Gg: AYBFou0yF2Iu0kYCUGHXSxmi9bGDuLNISctJmIlZO1YdOO8qRvakx7PDluIMMY8Gaey
	V+Dj4Z4VyyEkrjqpA/8AwSwIEnhC4aP1xPv2UqUKzRxBhacYnaiMqK4fl1ITUqOokUuieCkoWEX
	H04Txeh8CPhzLb4hwhpL3S2yP5+Hx/xffLO9wwcamxBa+Q9Cy/hlVo0Jjd684ZyUe/fyNAD2nFY
	8XbxKHvMFaP6RIxiGh9xZVO2BemObAhyJfOp7dTcjCymdCPJsaWcU/q1SWIg8U1intP+rAB4Lq8
	Eryrzb2l9wTzCWzNdavIa/y/ZOWVeKVFmDJbU4VvkB9xl9WCF20OBruQuBsZc+hkQvNM6OaQRkP
	or3hlxSEaP8iJQ4QlQDuzuqAgEU161i3TQXAo4KqU
X-Received: by 2002:a05:6808:5143:b0:4b8:4703:db93 with SMTP id
 5614622812f47-4cb6a5e4700mr2519969b6e.28.1789655395992; Thu, 17 Sep 2026
 07:29:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260804072630.28745-1-arash.golgol@gmail.com>
 <CAMxPZkgk4+idrZowJ1z-ddAzaD-hx-NJP+KSj8pUrSfL0HH4aQ@mail.gmail.com>
 <CAMxPZkhjurfpPvvymamJqTuia8CtFw1gRyYA4KBwFcQoH5jz3A@mail.gmail.com> <20260917120950.GA44274@killaraus.ideasonboard.com>
In-Reply-To: <20260917120950.GA44274@killaraus.ideasonboard.com>
From: arash golgol <arash.golgol@gmail.com>
Date: Thu, 17 Sep 2026 17:59:42 +0330
X-Gm-Features: AcwNN1XNeWNDN1FkqRE3CEAEFF1YFDG9VTOj1PGQgDvjVE6m2w9z6Yu-7cmX5kk
Message-ID: <CAMxPZkhoRAoz9mO29dC_+M9uEfmASpFrJqud73tz+8merQ06TA@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] media: sunxi: Resend active-state conversions
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	yong.deng@magewell.com, paulk@sys-base.io, mchehab@kernel.org, 
	wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Thu, Sep 17, 2026 at 3:39=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Arash,
>
> Your patches have been merged in

Thanks for the update. I really appreciate your review and help with
getting these patches merged.

> https://gitlab.freedesktop.org/linux-media/media-committers. I'm sorry
> it took so long. I really appreciate the work you've done here.

No worries about the delay. I really appreciate all the time everyone
put into this.

> On Mon, Sep 07, 2026 at 08:15:02AM +0330, arash golgol wrote:
> > On Wed, Aug 12, 2026 at 9:50=E2=80=AFAM arash golgol wrote:
> > > On Tue, Aug 4, 2026 at 10:57=E2=80=AFAM Arash Golgol wrote:
> > > >
> > > > These three patches convert the sun6i-mipi-csi2, sun8i-a83t-mipi-cs=
i2,
> > > > and sun6i-csi bridge drivers to use the V4L2 subdev active state AP=
I.
> > > >
> > > > Each patch has already received review and testing individually in
> > > > previous postings (see the changelog and links within each patch fo=
r
> > > > that history), but none have been picked up and none currently have
> > > > a delegate on patchwork. Resending together to make it easier to
> > > > review and apply as a group.
> > > >
> > > > No code changes since the last posted version of each patch.
> > > >
> > > > Arash Golgol (3):
> > > >   media: sun6i-mipi-csi2: Use V4L2 subdev active state
> > > >   media: sun8i-a83t-mipi-csi2: Use V4L2 subdev active state
> > > >   media: sun6i-csi: bridge: Use V4L2 subdev active state
> > > >
> > > >  .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 155 ++++++++------=
----
> > > >  .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
> > > >  .../sunxi/sun6i-csi/sun6i_csi_capture.c       |  27 ++-
> > > >  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 107 ++++++------
> > > >  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h   |   2 -
> > > >  .../sun8i_a83t_mipi_csi2.c                    | 112 +++++++------
> > > >  .../sun8i_a83t_mipi_csi2.h                    |   2 -
> > > >  7 files changed, 194 insertions(+), 220 deletions(-)
> > > >
> > > > --
> > > > 2.34.1
> > >
> > > I've been trying to get these patches merged for a while.
> > > Multiple pings and followups have been sent, but they haven't
> > > been applied yet. This series is just a collection of my
> > > individual patches.
> > >
> > > All patches have full Reviewed-by/Tested-by coverage from
> > > Laurent Pinchart and Paul Kocialkowski. Current status of all
> > > patches are still New in patchwork, without a delegate.
> > >
> > > Link: https://patchwork.linuxtv.org/project/linux-media/list/?series=
=3D28738
> > >
> > > Given the review is complete, would you be able to pick these
> > > up, or let me know if something else is blocking them?
> >
> > Just following up on this series.
> > Link to series:
> > https://patchwork.linuxtv.org/project/linux-media/list/?series=3D28738
--=20
Regards,
Arash Golgol
