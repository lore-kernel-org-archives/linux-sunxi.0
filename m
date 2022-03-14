Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net (zg8tmja2lje4os4yms4ymjma.icoremail.net [206.189.21.223])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 7BC29EA2
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Mar 2022 02:19:53 +0000 (UTC)
Received: from localhost (unknown [192.168.98.254])
	by app1 (Coremail) with SMTP id C4KowACHqlI2oS5iGO1LAA--.42797S2;
	Mon, 14 Mar 2022 09:58:14 +0800 (CST)
Date: Mon, 14 Mar 2022 09:58:14 +0800
From: fuyao <fuyao1697@cyg.com>
To: Evgeny Boger <boger@wirenboard.com>
Cc: devicetree@vger.kernel.org, jernej.skrabec@gmail.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev, maijianzhang@allwinnertech.com,
	mripard@kernel.org, robh+dt@kernel.org, wens@csie.org
Subject: Re: [PATCH] sunxi:dts: remove r40 can node
Message-ID: <Yi6hNkerDE0oyilv@scg>
Mail-Followup-To: Evgeny Boger <boger@wirenboard.com>,
	devicetree@vger.kernel.org, jernej.skrabec@gmail.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev, maijianzhang@allwinnertech.com,
	mripard@kernel.org, robh+dt@kernel.org, wens@csie.org
References: <YiCnR5v9fYoXXy39@scg>
 <bc846d95-5571-cfd1-c848-1ae9240f50a4@wirenboard.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bc846d95-5571-cfd1-c848-1ae9240f50a4@wirenboard.com>
Organization: fuyao_love_xxt.Allwinnertech.Technology
X-CM-TRANSID:C4KowACHqlI2oS5iGO1LAA--.42797S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYX7k0a2IF6F4UM7kC6x804xWl1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
	x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWx
	JVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
	W8Jr0_Cr1UM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8C
	rVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxVWUJVW8JwAv7VCjz48v1sIEY2
	0_Gr4lYx0Ec7CjxVAajcxG14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvE
	wIxGrwACI402YVCY1x02628vn2kIc2xKxwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l42
	xK82IY6x8ErcxFaVAv8VW8GwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v2
	6r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2
	Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_
	Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMI
	IF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07UIfO7UUUUU
	=
X-CM-SenderInfo: 5ix1t0irwzlqxf1jhudrp/

On Wed, Mar 09, 2022 at 02:44:56AM +0300, Evgeny Boger wrote:
> Hi,
> 
> as I explained in the original commit message, CAN is definitely there and
> is working perfectly at least on A40i.
> I know it was removed from the user manual, but I personally verified that
> it is working.
sorry, I forgot read the commit msg;
> 
> Maybe you can tell why CAN should be removed besides not being described in
> the manual? Are there some hardware or maybe license issues?

i will test it again. 

thanks!

> 
> Thanks!
> 
> --
>  Best wishes,
>  Evgeny Boger
>  CTO @ wirenboard.com
> 
> 
> 
> 

-- 
Technology is exciting

