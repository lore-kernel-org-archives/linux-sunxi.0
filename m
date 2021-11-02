Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3652C8E
	for <linux-sunxi@lists.linux.dev>; Tue,  2 Nov 2021 03:04:40 +0000 (UTC)
Received: from dggeme755-chm.china.huawei.com (unknown [172.30.72.53])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4HjvS66vqGzSh0v;
	Tue,  2 Nov 2021 10:46:46 +0800 (CST)
Received: from [10.67.110.136] (10.67.110.136) by
 dggeme755-chm.china.huawei.com (10.3.19.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.15; Tue, 2 Nov 2021 10:48:14 +0800
Subject: Re: [PATCH] drm: Grab reference of connector before return connector
 from sun4i_tcon_get_connector
To: Jani Nikula <jani.nikula@linux.intel.com>, <mripard@kernel.org>,
	<wens@csie.org>, <airlied@linux.ie>, <daniel@ffwll.ch>,
	<jernej.skrabec@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<dri-devel@lists.freedesktop.org>, <linux-sunxi@lists.linux.dev>
References: <20211101062906.231518-1-heying24@huawei.com>
 <87cznkdo6p.fsf@intel.com>
From: He Ying <heying24@huawei.com>
Message-ID: <33e01d45-c9f9-0e8c-6871-868ecd198368@huawei.com>
Date: Tue, 2 Nov 2021 10:48:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <87cznkdo6p.fsf@intel.com>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.136]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggeme755-chm.china.huawei.com (10.3.19.101)
X-CFilter-Loop: Reflected


ÔÚ 2021/11/1 21:02, Jani Nikula Ð´µÀ:
> On Mon, 01 Nov 2021, He Ying <heying24@huawei.com> wrote:
>>  From the comments of drm_for_each_connector_iter(), we know
>> that "connector is only valid within the list body, if you
>> want to use connector after calling drm_connector_list_iter_end()
>> then you need to grab your own reference first using
>> drm_connector_get()". So fix the wrong use of connector
>> according to the comments and then call drm_connector_put()
>> after using connector finishes.
>>
>> Signed-off-by: He Ying <heying24@huawei.com>
> Please use "drm/sun4i:" subject prefix for sun4i patches.

OK. I'll send a V2 later. By the way, may I have your suggestions about

this patch's content.

