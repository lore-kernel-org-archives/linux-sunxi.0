Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C212F80
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Jun 2021 17:13:53 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id y2so25970272ybq.13
        for <linux-sunxi@lists.linux.dev>; Mon, 07 Jun 2021 10:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X2sWRLPG/DuNEAApAcldlJg7iaLltjLRByHQl8QTub4=;
        b=axEtG15SmqLs7cRNPDLxPP0ciJMdYGvPisyOVlNwdgBchw8u7c9ZLFQF8q9XZAXoVe
         fSawLJJMvid3wqDthM8MS+dv+N16Q8Q1NCqu9twv7JgSEKSNAn6T4fic9im8N11+LqNJ
         zmUEHLkSSiFVUbSyObu4y2pqLoEAPCFW9QSt2NEbzreKnPbV996Vg95fVGUYbuBJkjYj
         4Q3TbZCJ8Cpk/Ny1jgKI4BPFw6jxmQgeB9af2njqnoPapJTq2BP4+6KdvTwrEavFFKs/
         FkOWHsxfPb8gYdnmITfIYEPtAPmcaSg3LQtFgyto+9LwZq3NnxxkYWHeSksL39NGv459
         vOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X2sWRLPG/DuNEAApAcldlJg7iaLltjLRByHQl8QTub4=;
        b=dumjODZPyjnY+SvsHCAv//t+S7vhtZKpNcOM4Csc3wT+HvFJVTIROcJu+k6ziFgDPx
         9h8yccOJvJzE1CBSSFjQFXkGkjn7apNhEIIfVFm9YFQ8yRg+ZrFSRjWY/Jy369xNCuxB
         bWEYGgc0HvEhtUGLRgkjjiSB38KlqInX4UhtYkpg9STHQ64WyKS5vC8vXirc9fmbXoCy
         Fu2pmFWHhGP1C540aLQQ7JNxCjdlQLzfXF8FvJ4TKH+mE90P8eiFgBVB8G5DeVOsCWru
         C8/LKcibVKFPL9dSUPwKZrHBX+D+UkuaHF4Bdqs3oxIaQX6lENtbmIz4AUBM9mb3Az7n
         IVOw==
X-Gm-Message-State: AOAM530bqZ52lGYA6tbT6F9CC5jSRPLZL0/wE8Rc909pV4vkigqrofAq
	enCYpqrprL/K3TfgfE1XhwMn+CfziIfcJNmAn2HW7A==
X-Google-Smtp-Source: ABdhPJwdmdD7lKRRq8k5XA8hFlIx/dEaUtuNmHO6Lre9fhKf0b+w+tgKMfisGp4de674sb5QMAE3GO/pM514c6iWKLc=
X-Received: by 2002:a25:cbc9:: with SMTP id b192mr26086185ybg.96.1623086031875;
 Mon, 07 Jun 2021 10:13:51 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210607085836.2827429-1-megous@megous.com> <20210607114146.ohiqf4ousibfu4wm@gilmour>
In-Reply-To: <20210607114146.ohiqf4ousibfu4wm@gilmour>
From: Saravana Kannan <saravanak@google.com>
Date: Mon, 7 Jun 2021 10:13:15 -0700
Message-ID: <CAGETcx-ZH2egh4kNpAL8CTGTVo21nP8aYpU_W+UHZ_GLJDeLaw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/sun4i: dw-hdmi: Make HDMI PHY into a platform device
To: Maxime Ripard <maxime@cerno.tech>
Cc: Ondrej Jirman <megous@megous.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>, 
	Daniel Vetter <daniel@ffwll.ch>, 
	"open list:DRM DRIVER FOR ALLWINNER DE2 AND DE3 ENGINE" <dri-devel@lists.freedesktop.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 7, 2021 at 4:41 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Mon, Jun 07, 2021 at 10:58:36AM +0200, Ondrej Jirman wrote:
> > From: Saravana Kannan <saravanak@google.com>
> >
> > On sunxi boards that use HDMI output, HDMI device probe keeps being
> > avoided indefinitely with these repeated messages in dmesg:
> >
> >   platform 1ee0000.hdmi: probe deferral - supplier 1ef0000.hdmi-phy
> >     not ready
> >
> > There's a fwnode_link being created with fw_devlink=on between hdmi
> > and hdmi-phy nodes, because both nodes have 'compatible' property set.
> >
> > Fw_devlink code assumes that nodes that have compatible property
> > set will also have a device associated with them by some driver
> > eventually. This is not the case with the current sun8i-hdmi
> > driver.
> >
> > This commit makes sun8i-hdmi-phy into a proper platform device
> > and fixes the display pipeline probe on sunxi boards that use HDMI.
> >
> > More context: https://lkml.org/lkml/2021/5/16/203
> >
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > Signed-off-by: Ondrej Jirman <megous@megous.com>
>
> Applied, thanks
> Maxime

Thanks everyone! And thanks for following up on this Ondrej!

-Saravana
