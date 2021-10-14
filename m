Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com [91.221.196.215])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E57672
	for <linux-sunxi@lists.linux.dev>; Thu, 14 Oct 2021 18:52:42 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
	by mx1.smtp.larsendata.com (Halon) with ESMTPS
	id e4e737a1-2d1f-11ec-9c3f-0050568c148b;
	Thu, 14 Oct 2021 18:52:34 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: sam@ravnborg.org)
	by mail01.mxhotel.dk (Postfix) with ESMTPSA id CD46C194B57;
	Thu, 14 Oct 2021 20:52:41 +0200 (CEST)
Date: Thu, 14 Oct 2021 20:52:32 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Nikola Pavlica <pavlica.nikola@gmail.com>
Cc: dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
	airlied@linux.ie, daniel@ffwll.ch,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panel-simple: Add Vivax TPC-9150 panel v6
Message-ID: <YWh8cDO7n/okeCRM@ravnborg.org>
References: <20211011212731.77763-1-pavlica.nikola@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211011212731.77763-1-pavlica.nikola@gmail.com>

Hi Nikola,
On Mon, Oct 11, 2021 at 11:27:31PM +0200, Nikola Pavlica wrote:
> The model and make of the LCD panel of the Vivax TPC-9150 is unknown,
> hence the panel settings that were retrieved with a FEX dump are named
> after the device NOT the actual panel.
> 
> The LCD in question is a 50 pin MISO TFT LCD panel of the resolution
> 1024x600 used by the aforementioned device.
> 
> Version 2, as Thierry kindly suggested that I fix the order in which the
> panel was ordered compared to others.
> 
> Version 3, filling in the required info suggested by Sam. Plus some
> factual issues that I've corrected myself (tested working)
> 
> Version 4, rearranged the display parameters and fix invalid bit format
> issue. (Thanks Sam)
> 
> Version 5, referred to FEX file instead of manual debugging for
> information.
> 
> Version 6, same as above. This time, it'll be documented.
Looks good now, applied to drm-misc-next.
There was an extra line I deleted while applying - checkpatch --strict
complained.
Patch will show up in -next in 1-2 weeks.

	Sam
