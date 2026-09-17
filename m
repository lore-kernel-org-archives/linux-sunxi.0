Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254474E06D1
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Sep 2026 12:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647001; cv=none; b=o7RgKh3tRYXOCAVOzRpRjkWSDx4xdrisS9kGdDSZVT8kTmF/hCKmtKTPSIj81kRHnvXDU8Ci6dHFu4FM+Pz2OEKDQvsBNpvziqbQ+kdYhOcq55u8kOLtrqvsLclv3FmmhOAzoQOwPtMfUJpEoU82RU5UOjJ/DXIoPq4zNmD8i/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647001; c=relaxed/simple;
	bh=YSUw6AYQlpCx82S4qpDEzxcG4DE/YEviLxFC0Ymvx3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fb9Jydd/SZba9nkQejlXv2hDu8cuSduSoA8TxTOTyM4m7gKpxytz+AoprmPMutgVilWJPWF3iB6Bmt3w3+UPx37AGMHP39nK4VsoGyETD75br1oHeWP7o/sEJID/xFUjKQowvmTEPVsq6EH8poBTzC3RZtpnbB18RYVYviYXHJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=o7G8FZ/h; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="o7G8FZ/h"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2505726CF;
	Thu, 17 Sep 2026 14:08:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789646890;
	bh=YSUw6AYQlpCx82S4qpDEzxcG4DE/YEviLxFC0Ymvx3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o7G8FZ/hOwdQOujtMAOm5FePU3dG5oP+IXOFBBhNqaC7ABrSMy/umq4pNzJB+c/K6
	 Zod4K0czm1r3cdez1i0c8X0OZhOvAslAfXFzIQ3MvHtPgjuKaDBWgEHjVQ7qgHGa1r
	 NByD4KeT5VtZ6RKIMXbYjDqg+sBSEu5BnT80uebk=
Date: Thu, 17 Sep 2026 15:09:50 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: arash golgol <arash.golgol@gmail.com>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	yong.deng@magewell.com, paulk@sys-base.io, mchehab@kernel.org,
	wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org
Subject: Re: [PATCH v1 0/3] media: sunxi: Resend active-state conversions
Message-ID: <20260917120950.GA44274@killaraus.ideasonboard.com>
References: <20260804072630.28745-1-arash.golgol@gmail.com>
 <CAMxPZkgk4+idrZowJ1z-ddAzaD-hx-NJP+KSj8pUrSfL0HH4aQ@mail.gmail.com>
 <CAMxPZkhjurfpPvvymamJqTuia8CtFw1gRyYA4KBwFcQoH5jz3A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMxPZkhjurfpPvvymamJqTuia8CtFw1gRyYA4KBwFcQoH5jz3A@mail.gmail.com>

Hi Arash,

Your patches have been merged in
https://gitlab.freedesktop.org/linux-media/media-committers. I'm sorry
it took so long. I really appreciate the work you've done here.

On Mon, Sep 07, 2026 at 08:15:02AM +0330, arash golgol wrote:
> On Wed, Aug 12, 2026 at 9:50 AM arash golgol wrote:
> > On Tue, Aug 4, 2026 at 10:57 AM Arash Golgol wrote:
> > >
> > > These three patches convert the sun6i-mipi-csi2, sun8i-a83t-mipi-csi2,
> > > and sun6i-csi bridge drivers to use the V4L2 subdev active state API.
> > >
> > > Each patch has already received review and testing individually in
> > > previous postings (see the changelog and links within each patch for
> > > that history), but none have been picked up and none currently have
> > > a delegate on patchwork. Resending together to make it easier to
> > > review and apply as a group.
> > >
> > > No code changes since the last posted version of each patch.
> > >
> > > Arash Golgol (3):
> > >   media: sun6i-mipi-csi2: Use V4L2 subdev active state
> > >   media: sun8i-a83t-mipi-csi2: Use V4L2 subdev active state
> > >   media: sun6i-csi: bridge: Use V4L2 subdev active state
> > >
> > >  .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 155 ++++++++----------
> > >  .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
> > >  .../sunxi/sun6i-csi/sun6i_csi_capture.c       |  27 ++-
> > >  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 107 ++++++------
> > >  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h   |   2 -
> > >  .../sun8i_a83t_mipi_csi2.c                    | 112 +++++++------
> > >  .../sun8i_a83t_mipi_csi2.h                    |   2 -
> > >  7 files changed, 194 insertions(+), 220 deletions(-)
> > >
> > > --
> > > 2.34.1
> >
> > I've been trying to get these patches merged for a while.
> > Multiple pings and followups have been sent, but they haven't
> > been applied yet. This series is just a collection of my
> > individual patches.
> >
> > All patches have full Reviewed-by/Tested-by coverage from
> > Laurent Pinchart and Paul Kocialkowski. Current status of all
> > patches are still New in patchwork, without a delegate.
> >
> > Link: https://patchwork.linuxtv.org/project/linux-media/list/?series=28738
> >
> > Given the review is complete, would you be able to pick these
> > up, or let me know if something else is blocking them?
> 
> Just following up on this series.
> Link to series:
> https://patchwork.linuxtv.org/project/linux-media/list/?series=28738

-- 
Regards,

Laurent Pinchart
