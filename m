Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9321BC3B
	for <linux-sunxi@lists.linux.dev>; Fri, 22 Mar 2024 09:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711099375; cv=none; b=RQr6Y3ykgAyw+iXWI5PGG02Zmp1kikk2lXp2vgrJhYD53FpSKF4tYNKFoWuZMHWA5Xe8n0FJYYfphJSsBrb7rtXKxLb2OfttOgn+l0QAn3nf1BHIcCov19NHf9dAACioiZcpH/MO10MDjGissMtU3T/Top2aQwQPw6Dgq0sBilE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711099375; c=relaxed/simple;
	bh=dqz+Usb0C8ozA80PCCBjHib9D3xaFY8srzv1b7krGc4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZDKJILkExpjDsv/u0xbdloXf3d5XdeISfDF2ee2tk/RtLh3ie2XZZwP/Gs24tAfGzAlJP4kTADffqiSgBhrMYTlpZlDffI6Ue0CFz8VFInJxj0pBQlpXWeWbSeTiE2UCLFLb1LQPyW8j/RKso6HYCFVvJi2CcpsiNI8KcGdfih4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NxH2Jc1q; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NxH2Jc1q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711099373; x=1742635373;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=dqz+Usb0C8ozA80PCCBjHib9D3xaFY8srzv1b7krGc4=;
  b=NxH2Jc1qYKllkJBGlhX3RGHrUjKoERA8ykUTVJCiop6oebfqta7xS5cy
   Nnyy/woNYK5J9aZCdJx+egI7jjGPYdaXXQCQKCSrgEtuvqKMPM+KMOwlg
   ZLzAMlR7CDjWFsxaYKEXgdKAT7ULgUqzyGWk0bcf0Gtx0oPA1vK+6D/g2
   fRlC2inVtujfjD6VgOhHnKygLnul5G0ZGNyQVyLPkjxcShHWehLSNFPWj
   CxJABElIF41sAmFdmedJ0yx/YmvX2Lb7NUTcpcQxPV84Oc+zt4DCx2cBc
   e0kxS4EV4fut4YOwTXGoKROTpgT1ZW2uIrizTGZVWmmQvJaH0vg3qJwVn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="31575283"
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; 
   d="scan'208";a="31575283"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 02:22:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; 
   d="scan'208";a="19508193"
Received: from ghoshsu1-mobl.ger.corp.intel.com (HELO localhost) ([10.252.55.6])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 02:22:19 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sui Jingfeng <sui.jingfeng@linux.dev>, Maxime Ripard
 <mripard@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, Sandy Huang
 <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Sebastian Wick
 <sebastian.wick@redhat.com>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [v10,20/27] drm/connector: hdmi: Add Infoframes generation
In-Reply-To: <07125064-2a78-4515-bb48-655f2aec140f@linux.dev>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240321-kms-hdmi-connector-state-v10-20-e6c178361898@kernel.org>
 <07125064-2a78-4515-bb48-655f2aec140f@linux.dev>
Date: Fri, 22 Mar 2024 11:22:14 +0200
Message-ID: <87sf0iliyh.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, 22 Mar 2024, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
> Hi,
>
>
> On 2024/3/21 23:29, Maxime Ripard wrote:
>> Infoframes in KMS is usually handled by a bunch of low-level helpers
>> that require quite some boilerplate for drivers. This leads to
>> discrepancies with how drivers generate them, and which are actually
>> sent.
>>
>> Now that we have everything needed to generate them in the HDMI
>> connector state, we can generate them in our common logic so that
>> drivers can simply reuse what we precomputed.
>>
>> Signed-off-by: Maxime Ripard <mripard@kernel.org>
>> ---
>>   drivers/gpu/drm/Kconfig                            |   1 +
>>   drivers/gpu/drm/drm_atomic_state_helper.c          | 338 +++++++++++++++++++++
>>   drivers/gpu/drm/drm_connector.c                    |  14 +
>>   .../gpu/drm/tests/drm_atomic_state_helper_test.c   |   1 +
>>   drivers/gpu/drm/tests/drm_connector_test.c         |  12 +
>>   include/drm/drm_atomic_state_helper.h              |   8 +
>>   include/drm/drm_connector.h                        | 109 +++++++
>>   7 files changed, 483 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> index 16029435b750..3d3193c7aa5f 100644
>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -97,10 +97,11 @@ config DRM_KUNIT_TEST
>>   	  If in doubt, say "N".
>>   
>>   config DRM_KMS_HELPER
>>   	tristate
>>   	depends on DRM
>> +	select DRM_DISPLAY_HDMI_HELPER
>
> Should we select DRM_DISPLAY_HELPER here? Otherwise there will have some compile error
> emerged with default config.

Can we stop abusing select instead of adding more selects to paper over
the issues?

Use select only for non-visible symbols (no prompts anywhere) and for
symbols with no dependencies.


BR,
Jani.


>
>
> : drivers/gpu/drm/drm_atomic_state_helper.o: in function `drm_atomic_helper_connector_hdmi_check':
> drm_atomic_state_helper.c:(.text+0x15e4): undefined reference to `drm_hdmi_avi_infoframe_colorimetry'
> : drm_atomic_state_helper.c:(.text+0x15f0): undefined reference to `drm_hdmi_avi_infoframe_bars'
> : drm_atomic_state_helper.c:(.text+0x1638): undefined reference to `drm_hdmi_infoframe_set_hdr_metadata'
> make[2]: *** [scripts/Makefile.vmlinux:37: vmlinux] Error 1
>
> make[1]: *** [/home/suijingfeng/UpStream/drm-tip/Makefile:1162: vmlinux] Error 2
>
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:240: __sub-make] Error 2
>
>>   	help
>>   	  CRTC helpers for KMS drivers.
>>   
>>   config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
>>           bool "Enable refcount backtrace history in the DP MST helpers"

-- 
Jani Nikula, Intel
