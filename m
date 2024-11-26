Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7C718FDBA
	for <linux-sunxi@lists.linux.dev>; Tue, 26 Nov 2024 10:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732616205; cv=none; b=Yh5D+tWFslxkWfFyrFoBGnxJhVgeWB/vWP1nRN7gWyS/i7r9L8+tJckxl5bX1xhaPzK6BTpUkS64A/rg2lX/iS7RUhP+7SWpTbhGGkENQqhYQgnOMal/Mo7j1lV3pXGdHs0umosEfkBkZf7h+01G4eWjoEZmTj+LYBLHbTU3Zqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732616205; c=relaxed/simple;
	bh=G6ISiKyYNdfCX1O1jSv9YCVzyH3xaVsB7/c5w8mAdLM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cx7U1yAbITHCWER88THA9cN4uXdSYx+wonBcFjdCm24f63HgUkTGxjAKbhv20oun0ctRWLT6qb7DvuV2m4kRSIqf0GjrMftPCOmB2MoQPtddw1UdM6KufqSl3K72ffzg2m75fLnVbeVLr0BIxl8wRJ91J0spQuZYYTnqTR6Ax8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RFYztgLF; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RFYztgLF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732616204; x=1764152204;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=G6ISiKyYNdfCX1O1jSv9YCVzyH3xaVsB7/c5w8mAdLM=;
  b=RFYztgLFhI4+YJq8oWBZ1xwPO7eA4IQOhYGknjzz7lsh54yZJHDnj3ED
   mL/FxOmc40H1QpWBqmK+dWLYq7Agwmy1JjLpDjX/8Nc5ZAYiterHiwuJ6
   pBUrgIbTAjfqkSD6B9eqEkLiIQNfQdJuv1dqVIYsmkPuAlFXZuHwowh8y
   POyV5ZUVTTa5XgLFA3qOAs3XOx75oucDE9+OBDLSeFLGIzd/U90YzurDS
   EkCfkkX38LEFdXXgBvTutI7NsjcN/1MrXfREjoRJCOsOVnrucjlwPbTmN
   rLtL9RR/dCYNvbukZkatfXsAja9+37Fad+n+JlLoiKj+q/gXkK0r+hb51
   Q==;
X-CSE-ConnectionGUID: TUCCn0+pQymbE9sPI8XTVw==
X-CSE-MsgGUID: qtO5577bRhG5h31mAYmpLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="36428238"
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; 
   d="scan'208";a="36428238"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 02:16:43 -0800
X-CSE-ConnectionGUID: UPr7mqOHTa+cmtoDfqjH7w==
X-CSE-MsgGUID: 1LK8FOPvQtWU825GVRcwKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; 
   d="scan'208";a="91511370"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.49])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 02:16:37 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>, Sean Nyekjaer <sean@geanix.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Yannick
 Fertre <yannick.fertre@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 1/3] drm/modes: introduce drm_mode_validate_mode()
 helper function
In-Reply-To: <20241125-gleaming-anteater-of-perfection-42bd2b@houat>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241125-dsi-relax-v2-0-9113419f4a40@geanix.com>
 <20241125-dsi-relax-v2-1-9113419f4a40@geanix.com>
 <20241125-gleaming-anteater-of-perfection-42bd2b@houat>
Date: Tue, 26 Nov 2024 12:16:34 +0200
Message-ID: <874j3uxptp.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, 25 Nov 2024, Maxime Ripard <mripard@kernel.org> wrote:
> I wonder about the naming though (and prototype). I doesn't really
> validates a mode, but rather makes sure that a given rate is a good
> approximation of a pixel clock. So maybe something like
> drm_mode_check_pixel_clock?

Quoting myself from a few weeks back:

"""
Random programming thought of the day: "check" is generally a terrible
word in a function name.

Checking stuff is great, but what do you expect to happen if the check
passes/fails? Do you expect the function to return on fail, or throw an
exception? Or just log about it? If you return a value, what should the
return value mean? It's hard to know without looking it up.

Prefer predicates instead, is_stuff_okay() is better than
check_stuff(). Or assert_stuff() if you don't return on failures.
"""


BR,
Jani.


-- 
Jani Nikula, Intel
