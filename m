Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20408613D
	for <linux-sunxi@lists.linux.dev>; Tue,  6 Dec 2022 12:23:34 +0000 (UTC)
Received: by mail-vs1-f47.google.com with SMTP id t5so13976892vsh.8
        for <linux-sunxi@lists.linux.dev>; Tue, 06 Dec 2022 04:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FS41pdVPPftlkxjfAeNNX5m/JobiqQJnQqPs/qKrQKU=;
        b=j70OfvcxJivYV3jV9dIlvoC9BNn2MYMRSVLucnWH895vZoCq980rebl6a9/UqWIBdM
         3P0EvrkWWODPFvC78By6kuYcw+EMeJnHxb1NP5nq1lXfbLX+8mE2VTXby5bCBclYSdHO
         iEBZSqPMhcinbId1+ejPOAfhXxXBBEPP4zhL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FS41pdVPPftlkxjfAeNNX5m/JobiqQJnQqPs/qKrQKU=;
        b=tWCAQBOuwlHToTXWlLnxZIz2VsBh0Enq1X7JLhaR+hdrPLqBYj04mZYzsmWpJttKhA
         e3tUqZtNlYJayAxSjPzFf5Bx+xXGs4sppYvFl0zQXLG9dqCGVC1I/ndQO6eYcHZRGez8
         /8tvWr90S+UDmmgi4kQfmTEPBYgP8E3S5PZMOk0zRQRTF9ICzKOF1Z06bQB/8wQcrtH6
         UAWdP97CJZ/Il8dYujxo+GlleJm3X70maGKMtMqPCq/aMTIbahAm91I9JF2ZAUz5ORt7
         6iZzEBFP2dhdhjICi6aRX6Z4kh57ouqhtlqeKs71HUYBbqztMJTSGWrYO67G5Qks0o9r
         /WuA==
X-Gm-Message-State: ANoB5pkLcWhIWGsfKfO1T1FHtsz0uPYzhu76kixaxHm9kOxOgAX7ti8n
	S12hBTiBO1FNUdG+U2zeTE63zVySsd8D8DmJeaPirw==
X-Google-Smtp-Source: AA0mqf5jTjF11GvxCW7tLTboZIRLdroQaxX3DPq9TVWWQgiUfLFKRlMYFfIyx2FQJo5yv2rOIFkfQv1vYohWq1/7PT8=
X-Received: by 2002:a05:6102:e0c:b0:3b0:6da7:39ba with SMTP id
 o12-20020a0561020e0c00b003b06da739bamr35260338vst.26.1670329412933; Tue, 06
 Dec 2022 04:23:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221129074530.640251-1-wenst@chromium.org> <45143854.fMDQidcC6G@kista>
 <5d79ed06-15c0-3564-97b6-5fd4433acabf@xs4all.nl>
In-Reply-To: <5d79ed06-15c0-3564-97b6-5fd4433acabf@xs4all.nl>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 6 Dec 2022 20:23:21 +0800
Message-ID: <CAGXv+5GH==gm533P_sNiFTyaFwQXp-QLXRLWyABdsn+0p_83UQ@mail.gmail.com>
Subject: Re: [PATCH] media: cedrus: Convert to MPLANE uAPI
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Samuel Holland <samuel@sholland.org>, linux-media@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 6, 2022 at 4:35 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrot=
e:
>
> On 05/12/2022 22:01, Jernej =C5=A0krabec wrote:
> > Hi Chen-Yu!
> >
> > Dne torek, 29. november 2022 ob 08:45:30 CET je Chen-Yu Tsai napisal(a)=
:
> >> The majority of the V4L2 stateless video decoder drivers use the MPLAN=
E
> >> interface.
> >>
> >> On the userspace side, Gstreamer supports non-MPLANE and MPLANE
> >> interfaces. Chromium only supports the MPLANE interface, and is not ye=
t
> >> usable with standard desktop Linux. FFmpeg support for either has not
> >> landed.
> >
> > I don't like fixing userspace issues in kernel, if kernel side works fi=
ne.
> > Implementing missing non-MPLANE support in Chromium will also allow it =
to work
> > with older kernels.
> >
> > Hans, what's linux-media politics about such changes?
>
> Not keen on this. Does the cedrus HW even have support for multiple plane=
s?
> I suspect not, in which case the driver shouldn't suggest that it can do =
that.
>
> Now, if the hardware *can* support this, then there is an argument to be =
made
> for the cedrus driver to move to the multiplanar API before moving it out
> of staging to allow such future enhancements.

AFAIK it can, but has some limitations on how far apart the buffers for
the separate planes can be. Nicolas mentioned that I could support the
multiplanar API, but only allow the contiguous single planar formats,
so NV12 instead of NV12M.

And I suspect that reference frames have to be contiguous as well.
So I guess the overall answer is that it can't. But the same goes for
Hantro or rkvdec, which both use the multiplanar API.

This conversion was done so that I could use Cedrus as a testbed for
developing new codec support, as I already own an H6 device. Added
bonus is trying to get V4L2 decoder support to work for desktop Linux,
without the libraries that ChromeOS ships.

> Note that you have to choose whether to support single or multiplanar, yo=
u
> can't support both at the same time.
>
> So the decision to move to multiplanar should be led by the HW capabiliti=
es.
>
> And Chromium really needs to support non-multiplanar formats as well. I'm
> really surprised to hear that it doesn't, to be honest.

Chromium does support non-multiplanar formats, such as NV12. In fact
this is the preferred format, unless it's on MediaTek, in which it
switches to MM21 as the capture format, and does untiling in software.
This support for formats is separate from using the multiplanar API.

Support for video decoders is mostly driven by ChromeOS. Currently all the
hardware ChromeOS supports, be it stateful or stateless, use the multiplana=
r
API, so there hasn't been a real need to support it yet.


Regards
ChenYu

> Regards,
>
>         Hans
>
> >
> > Best regards,
> > Jernej
> >
> >>
> >> A fallback route using libv4l is also available. The library translate=
s
> >> MPLANE interface ioctl calls to non-MPLANE ones, provided that the pix=
el
> >> format used is single plane.
> >>
> >> Convert the Cedrus driver to the MPLANE interface, while keeping the
> >> supported formats single plane. Besides backward compatibility through
> >> the plugin, the hardware requires that different planes not be located
> >> too far apart in memory. Keeping the single plane pixel format makes
> >> this easy to enforce.
> >>
> >> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> >> ---
> >>
> >> This has been tested with Fluster. The score remained the same with or
> >> without the patch. This also helps with getting VP8 decoding working
> >> with Chromium's in-tree test program "video_decode_accelerator_tests",
> >> though Chromium requires other changes regarding buffer allocation and
> >> management.
> >
> >
>
