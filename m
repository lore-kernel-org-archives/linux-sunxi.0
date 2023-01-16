Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0722446B5
	for <linux-sunxi@lists.linux.dev>; Mon, 16 Jan 2023 16:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673886003; x=1705422003;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=3kP3+Z/fGb1HUUCGydhyc9dGWiwyXHQhkXAlft+qAzY=;
  b=O+jGBDv1wkdgNz+iubPM+2zPPetH3eq+JCKtA89kuVZSJuBNoTN/VTAB
   w0M9Irjn8Qj6fm+rfTSKrzhNxovvcwtRA/rfMDbV3Xqiz8IhoysYavdN1
   rPG0FYwxRAMwYqFc6hg0QfRzbGHpRmoIlzJGp2ojb8klh4niZZbrAaNh9
   HwfrbED7WTMnB2zoR8E+ccNx/Zx/fMCittugQ6CzagJWIasd0usmnUkIg
   Kk8t0DeHjjItBhypIpqA/AWyFAPr9G7sRZT/YMIAEgQGKnl1wisp178t4
   5WKIuUqQdZwxnQXuqBpMj/YFWPW34Z1dCNnnWCclia1wU9yiT44eUWnQp
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="324558184"
X-IronPort-AV: E=Sophos;i="5.97,221,1669104000"; 
   d="scan'208";a="324558184"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2023 08:20:03 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="766952438"
X-IronPort-AV: E=Sophos;i="5.97,221,1669104000"; 
   d="scan'208";a="766952438"
Received: from amakarev-mobl2.ger.corp.intel.com (HELO localhost) ([10.252.13.137])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2023 08:19:59 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, sam@ravnborg.org,
 daniel@ffwll.ch, airlied@gmail.com
Cc: linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
 linux-mips@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 00/22] drm: Remove includes for drm_crtc_helper.h
In-Reply-To: <20230116131235.18917-1-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230116131235.18917-1-tzimmermann@suse.de>
Date: Mon, 16 Jan 2023 18:19:56 +0200
Message-ID: <87k01me9jn.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, 16 Jan 2023, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> A lot of source files include drm_crtc_helper.h for its contained
> include statements. This leads to excessive compile-time dependencies.
>
> Where possible, remove the include statements for drm_crtc_helper.h
> and include the required source files directly. Also remove the
> include statements from drm_crtc_helper.h itself, which doesn't need
> most of them.
>
> I built this patchset on x86-64, aarch64 and arm. Hopefully I found
> all include dependencies.

I think this is the right direction and I support this. Personally I
think it's enough to build test and fix any fallout afterwards.

To that end, I did build test this myself with my config, and it was
fine, though that probably doesn't add much coverage.

FWIW,

Acked-by: Jani Nikula <jani.nikula@intel.com>


-- 
Jani Nikula, Intel Open Source Graphics Center
