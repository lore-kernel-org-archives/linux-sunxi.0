Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D7A70
	for <linux-sunxi@lists.linux.dev>; Mon, 17 May 2021 08:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
	t=1621240198; bh=2VhAsUXgQ5oNkSlTwnPcKvmOph17V9lpnFgnWSI+JyE=;
	h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
	b=H8r63aEnFmsJHXroicoP8nx3sfwjSGZ6O2gVC2CPIay0DgRQZH84O871lEkRL1gwL
	 RuueK15iIJ+tkPASv9Dwdkj12RcPV+NqOLje9C3/crioDfY5QJbPWexV1tp2U2N+Sd
	 ZZJbCqng/ahGe1Gck8S9JQkP56fZLrbPBlA49jEI=
Date: Mon, 17 May 2021 10:29:57 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To: Saravana Kannan <saravanak@google.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-sunxi@lists.linux.dev, mripard@kernel.org, wens@csie.org,
	jernej.skrabec@gmail.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>, andre.przywara@arm.com
Subject: Re: fw_devlink=on and sunxi HDMI
Message-ID: <20210517082957.sddwy2dv5esbzmo4@core>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
	Saravana Kannan <saravanak@google.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-sunxi@lists.linux.dev, mripard@kernel.org, wens@csie.org,
	jernej.skrabec@gmail.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>, andre.przywara@arm.com
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20210516170539.2yxe43qwezonuo3r@core>
 <CAGETcx93RxfsXG51zeaUK+UyKdEDgivqkmS85mcMPp0H42X5ZQ@mail.gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGETcx93RxfsXG51zeaUK+UyKdEDgivqkmS85mcMPp0H42X5ZQ@mail.gmail.com>

On Sun, May 16, 2021 at 11:32:47PM -0700, Saravana Kannan wrote:
> On Sun, May 16, 2021 at 10:05 AM Ondřej Jirman <megi@xff.cz> wrote:
> >
> > Hello,
> >
> > Linux 5.13-rc1 again has fw_devlink=on enabled by default. I've found that this
> > breaks probing display pipeline and HDMI output on sunxi boards, because of
> > fwnode_link between hdmi and hdmi-phy nodes.
> >
> > HDMI device probe keeps being avoided with these repeated messages in dmesg:
> >
> >   platform 1ee0000.hdmi: probe deferral - supplier 1ef0000.hdmi-phy not ready
> >
> > Both nodes have their own compatible, but are implemented by a single
> > struct device.
> >
> > This looks like a kind of situation that's expected to break fw_devlink
> > expectations by my reading of the the e-mails about trying the fw_devlink=on
> > during 5.12 cycle.
> >
> > Is this supposed to be solved by implementing the PHY node as it's own
> > device or by breaking the fwnode_link between the hdmi phy and hdmi nodes?
> > Seems like second solution would be quicker now that rc1 is out.
> 
> Seems like sun8i_hdmi_phy_probe() already does 95% of the work to make
> the PHY a separate driver. Why not just finish it up by really making
> it a separate driver? I'd really prefer doing that because this seems
> unnecessarily messed up. The phy will have a struct device created for
> it already. You are just not probing it.

Currently it's all just a glue code for dw-hdmi, which is not using a phy
framework and handles both the controller and phy parts. dw-hdmi needs passing
platform data around
(https://elixir.bootlin.com/linux/latest/source/include/drm/bridge/dw_hdmi.h#L115)
to get a specific set of phy glue callbacks hooked into platform data of dw-hdmi
prior to calling dw_hdmi_probe.

Looking at other users of dw_hdmi_probe this is the only one that has this
unfortunate issue due to using phys binding internally as a part of one device.

Just making it a platform driver will also change the probe order of phy and the
controller, which I've heard from Jernej needs to have the current order of
(controller and then phy) perserved, for some reason, and will make things
still a bit more convoluted.

So this looks like needs quite a bit of thought.

regards,
	o.

> Thanks,
> Saravana
> 
> >
> > Where would be a good place to break that fwnode_link in code?
> >
> > Or can the fw_devlink code be made aware of this situation, where two fwnodes
> > are implemented by the same Linux device, somehow?
> >
> > Relevant references:
> >
> > https://elixir.bootlin.com/linux/v5.13-rc1/source/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c#L600
> > https://elixir.bootlin.com/linux/v5.13-rc1/source/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c#L212
> > https://elixir.bootlin.com/linux/v5.13-rc1/source/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi#L1176
> >
> > kind regards,
> >         o.
