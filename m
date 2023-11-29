Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAA9134BD
	for <linux-sunxi@lists.linux.dev>; Wed, 29 Nov 2023 09:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hqVj1xgz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701249513; x=1732785513;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=fg/SG84dFmw5xtLeQyneQ3hhwKW3Ii9jSwQZ6X2juJ0=;
  b=hqVj1xgzrgkYSs4PlbV1lm40Tq2cDdKErq6O7EWmoUZUkTQ9zAGi4f3X
   CCmbpxpqd+x5eC3KuOEo4SHTrbc4/Sbrwy3Z6MzkP+Z44XIFWChJxmwq3
   9frTtMm+s7e7de7Oevjnn9MEt+SsbnvLEcvL3nidzMloyBEHUHmkibqzl
   qcIXKhMkLgVQgJ+L3gYMYcuTjza9Vp3vVIfZQMhHTFR/imnGuokAD170/
   8kUaseonEjosu012ahtS2a8ACUtSgBXrElaPa3lnLPC4ULmFnuvZi7puJ
   UMFDEcJ75UbDGHl+SiFdo62G9T8SL0uSmoUSW1r3N2Tm3l0JLpPhCRBH7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="392876799"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="392876799"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 01:18:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="762242261"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="762242261"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
  by orsmga007.jf.intel.com with SMTP; 29 Nov 2023 01:18:25 -0800
Received: by stinkbox (sSMTP sendmail emulation); Wed, 29 Nov 2023 11:18:24 +0200
Date: Wed, 29 Nov 2023 11:18:24 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Emma Anholt <emma@anholt.net>, Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
	Sandy Huang <hjc@rock-chips.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-doc@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
	linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 05/45] drm/connector: Check drm_connector_init
 pointers arguments
Message-ID: <ZWcB4Ak8QnwkhObR@intel.com>
References: <20231128-kms-hdmi-connector-state-v4-0-c7602158306e@kernel.org>
 <20231128-kms-hdmi-connector-state-v4-5-c7602158306e@kernel.org>
 <87h6l66nth.fsf@intel.com>
 <v3hplco5fdedv6bnc6mwx2zhhw4xxdiekha26ykhc5cmy7ol77@2irk3w4hmabw>
 <ZWXv1Oi_sH0BRWao@intel.com>
 <2mnodqvu2oo674vspiy4gxhglu3it5cq47acx5itnbwevgc4cf@c7h2bvnx3m2n>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2mnodqvu2oo674vspiy4gxhglu3it5cq47acx5itnbwevgc4cf@c7h2bvnx3m2n>
X-Patchwork-Hint: comment

On Wed, Nov 29, 2023 at 10:11:26AM +0100, Maxime Ripard wrote:
> Hi Ville,
> 
> On Tue, Nov 28, 2023 at 03:49:08PM +0200, Ville Syrjälä wrote:
> > On Tue, Nov 28, 2023 at 02:29:40PM +0100, Maxime Ripard wrote:
> > > On Tue, Nov 28, 2023 at 02:54:02PM +0200, Jani Nikula wrote:
> > > > On Tue, 28 Nov 2023, Maxime Ripard <mripard@kernel.org> wrote:
> > > > > All the drm_connector_init variants take at least a pointer to the
> > > > > device, connector and hooks implementation.
> > > > >
> > > > > However, none of them check their value before dereferencing those
> > > > > pointers which can lead to a NULL-pointer dereference if the author
> > > > > isn't careful.
> > > > 
> > > > Arguably oopsing on the spot is preferrable when this can't be caused by
> > > > user input. It's always a mistake that should be caught early during
> > > > development.
> > > > 
> > > > Not everyone checks the return value of drm_connector_init and friends,
> > > > so those cases will lead to more mysterious bugs later. And probably
> > > > oopses as well.
> > > 
> > > So maybe we can do both then, with something like
> > > 
> > > if (WARN_ON(!dev))
> > >    return -EINVAL
> > > 
> > > if (drm_WARN_ON(dev, !connector || !funcs))
> > >    return -EINVAL;
> > > 
> > > I'd still like to check for this, so we can have proper testing, and we
> > > already check for those pointers in some places (like funcs in
> > > drm_connector_init), so if we don't cover everything we're inconsistent.
> > 
> > People will invariably cargo-cult this kind of stuff absolutely
> > everywhere and then all your functions will have tons of dead
> > code to check their arguments.
> 
> And that's a bad thing because... ?
> 
> Also, are you really saying that checking that your arguments make sense
> is cargo-cult?
> 
> We're already doing it in some parts of KMS, so we have to be
> consistent, and the answer to "most drivers don't check the error"
> cannot be "let's just give on error checking then".
> 
> > I'd prefer not to go there usually.
> > 
> > Should we perhaps start to use the (arguably hideous)
> >  - void f(struct foo *bar)
> >  + void f(struct foo bar[static 1])
> > syntax to tell the compiler we don't accept NULL pointers?
> > 
> > Hmm. Apparently that has the same problem as using any
> > other kind of array syntax in the prototype. That is,
> > the compiler demands to know the definition of 'struct foo'
> > even though we're passing in effectively a pointer. Sigh.
> 
> Honestly, I don't care as long as it's something we can unit-test to
> make sure we make it consistent. We can't unit test a complete kernel
> crash.

Why do you want to put utterly broken code into a unit test?

-- 
Ville Syrjälä
Intel
