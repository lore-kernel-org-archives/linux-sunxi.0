Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB44327700F
	for <linux-sunxi@lists.linux.dev>; Fri, 28 Feb 2025 18:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740768700; cv=none; b=gLmBUsV1xpRqQZuOo17VLyW6mClQVbo/s6KxnBWpseU7QEa41czgtdTywnTls62Qyjn2qeU5NIQNW0tlI1wkFvldlHJfPE+YRHxR9qteqNPjMURq4GRPXhuf9FkNxePwph9cCLFiSYHbsfzFf9HEikyLQQqaqcZC6nEPrn3/e1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740768700; c=relaxed/simple;
	bh=pkwgeMwCKf80SIaXk8KhThxONMPc4p/Xo+BvX6bjIBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=feISJWPoyCbBIPUhU8D6NaD6Xfr7OE4veQQBljvmyrx/3j0KrUi/J+glwQF4EIuAgZ7JUzIDGtPPAToTnTNhA3GhxLQ5RR6SsmlUIO+Z1M63+FAlzxC2TYN0gZeQnA5AZN6zt0NyEq8XFHr2YenyVRayNdvrjEoDq45sPxlwFEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B5VLe7eX; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B5VLe7eX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740768698; x=1772304698;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=pkwgeMwCKf80SIaXk8KhThxONMPc4p/Xo+BvX6bjIBg=;
  b=B5VLe7eXDCmxPhSyEc6of7d2ervWLxCfgISL3JepSFraYcrAXj+KcuAl
   nv28yHeuB0LoMQBsWKbetP0DkkvktJpZfF2SkBY/kDm9naICVUM9VnCHn
   S+6uAK+hh0XSu99z68rD5kbiWV/OfwgFu16AOQ1Nz2Ca079Gj9MP9hC9q
   GQfxXUFxZr0wdFN/wesSYajBgpgZr4HEl9G8NjzgfPd24bEc1vDcTIb9N
   RAH1MxfbRzfENpn9cG+laOkNoEV1e6m0FmL2/XjDEsLaOaCNO1N71jLAE
   7LAt1m1f/7LGQ32+qItJ9xas/CM1wEBx2l0Hq/KDuhobM4BLhf4sHDkcf
   A==;
X-CSE-ConnectionGUID: y50mcqvDQGKdniZCJE1S5g==
X-CSE-MsgGUID: 9P2TmVSaQaOaUI1XazwhOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="67083618"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; 
   d="scan'208";a="67083618"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 10:51:38 -0800
X-CSE-ConnectionGUID: aSyNmCmeRwqkQi0uhisfRA==
X-CSE-MsgGUID: IBifUjH4SWmgzTlo7TfT5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; 
   d="scan'208";a="117206022"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 10:51:31 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1to5SJ-0000000G3mv-0yeh;
	Fri, 28 Feb 2025 20:51:27 +0200
Date: Fri, 28 Feb 2025 20:51:27 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Rob Herring <robh@kernel.org>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Nuno Sa <nuno.sa@analog.com>, David Lechner <dlechner@baylibre.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Guillaume Stols <gstols@baylibre.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Dumitru Ceclan <mitrutzceclan@gmail.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Matteo Martelli <matteomartelli3@gmail.com>,
	Alisa-Dariana Roman <alisadariana@gmail.com>,
	Ramona Alexandra Nechita <ramona.nechita@analog.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v4 02/10] property: Add
 device_get_child_node_count_named()
Message-ID: <Z8IFr6LxK8m0kaDF@smile.fi.intel.com>
References: <cover.1740421248.git.mazziesaccount@gmail.com>
 <29ec24f1498392cafbecc0e0c0e23e1ce3289565.1740421248.git.mazziesaccount@gmail.com>
 <CAL_Jsq+av-fptMQqBeVieKwA9c7+uUCaqZMLGu-RVJzWZ_7+Vg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_Jsq+av-fptMQqBeVieKwA9c7+uUCaqZMLGu-RVJzWZ_7+Vg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Feb 28, 2025 at 11:07:24AM -0600, Rob Herring wrote:
> On Mon, Feb 24, 2025 at 12:33 PM Matti Vaittinen
> <mazziesaccount@gmail.com> wrote:

...

> > +unsigned int device_get_child_node_count_named(const struct device *dev,
> > +                                              const char *name)
> 
> I think this should be implemented as
> fwnode_get_child_node_count_named() with the device variant being just
> a wrapper.

Good catch! That's also added to our misunderstanding with Matti who didn't get
the role of dev_of_node() vs. dev_fwnode() in the first place.

-- 
With Best Regards,
Andy Shevchenko


