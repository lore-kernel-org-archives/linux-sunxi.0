Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29BD33D4
	for <linux-sunxi@lists.linux.dev>; Wed, 21 Sep 2022 13:28:20 +0000 (UTC)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MXfHr0fDfzMnvr;
	Wed, 21 Sep 2022 21:23:36 +0800 (CST)
Received: from [10.174.179.163] (10.174.179.163) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 21 Sep 2022 21:28:17 +0800
Message-ID: <d49dd06d-2681-9dcf-75d0-f434e33cc4e4@huawei.com>
Date: Wed, 21 Sep 2022 21:28:17 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH -next] sound: sunxi: fix declaration compile error
To: Mark Brown <broonie@kernel.org>
CC: <fengzheng923@gmail.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
	<samuel@sholland.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <liwei391@huawei.com>
References: <20220921033819.2188233-1-zengheng4@huawei.com>
 <YyrZIEH+n5UfbFGZ@sirena.org.uk>
From: Zeng Heng <zengheng4@huawei.com>
In-Reply-To: <YyrZIEH+n5UfbFGZ@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.163]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected

Thanks for your recommend.

I would pay more attention to proper subject line (like 'ASoC: sunxi: 
...') in the following patch.


在 2022/9/21 17:28, Mark Brown 写道:
> On Wed, Sep 21, 2022 at 11:38:19AM +0800, Zeng Heng wrote:
>> Just fix compile error without any logic changes.
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.
