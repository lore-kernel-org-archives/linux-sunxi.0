Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B2068
	for <linux-sunxi@lists.linux.dev>; Tue,  2 Nov 2021 08:37:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10155"; a="294667814"
X-IronPort-AV: E=Sophos;i="5.87,202,1631602800"; 
   d="scan'208";a="294667814"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2021 01:37:20 -0700
X-IronPort-AV: E=Sophos;i="5.87,202,1631602800"; 
   d="scan'208";a="500425503"
Received: from sohamdas-mobl.gar.corp.intel.com (HELO localhost) ([10.249.32.13])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2021 01:37:17 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: He Ying <heying24@huawei.com>, mripard@kernel.org, wens@csie.org, airlied@linux.ie, daniel@ffwll.ch, jernej.skrabec@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] drm: Grab reference of connector before return connector from sun4i_tcon_get_connector
In-Reply-To: <33e01d45-c9f9-0e8c-6871-868ecd198368@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211101062906.231518-1-heying24@huawei.com> <87cznkdo6p.fsf@intel.com> <33e01d45-c9f9-0e8c-6871-868ecd198368@huawei.com>
Date: Tue, 02 Nov 2021 10:37:14 +0200
Message-ID: <871r3zdkcl.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, 02 Nov 2021, He Ying <heying24@huawei.com> wrote:
> =E5=9C=A8 2021/11/1 21:02, Jani Nikula =E5=86=99=E9=81=93:
>> On Mon, 01 Nov 2021, He Ying <heying24@huawei.com> wrote:
>>>  From the comments of drm_for_each_connector_iter(), we know
>>> that "connector is only valid within the list body, if you
>>> want to use connector after calling drm_connector_list_iter_end()
>>> then you need to grab your own reference first using
>>> drm_connector_get()". So fix the wrong use of connector
>>> according to the comments and then call drm_connector_put()
>>> after using connector finishes.
>>>
>>> Signed-off-by: He Ying <heying24@huawei.com>
>> Please use "drm/sun4i:" subject prefix for sun4i patches.
>
> OK. I'll send a V2 later. By the way, may I have your suggestions about
> this patch's content.

Sorry, I only looked here because of the subject prefix, and would have
skipped it completely with a drm/sun4i prefix. ;)

BR,
Jani.


--=20
Jani Nikula, Intel Open Source Graphics Center
