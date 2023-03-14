Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D50B28EF
	for <linux-sunxi@lists.linux.dev>; Tue, 14 Mar 2023 08:35:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49BDBC433EF;
	Tue, 14 Mar 2023 08:34:59 +0000 (UTC)
Message-ID: <74ae8afe-c537-1714-77ec-8a80d8ddad69@xs4all.nl>
Date: Tue, 14 Mar 2023 09:34:57 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 01/28] media: cec: ch7322: drop of_match_ptr for ID table
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Joe Tessler <jrt@google.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Rui Miguel Silva <rmfrfs@gmail.com>, Wenyou Yang
 <wenyou.yang@microchip.com>, Bin Liu <bin.liu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Yong Deng <yong.deng@magewell.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Philipp Zabel <p.zabel@pengutronix.de>, Sean Young <sean@mess.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
 <b83d6b81-c4ec-4fb8-b626-84af80d1c4a3@roeck-us.net>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <b83d6b81-c4ec-4fb8-b626-84af80d1c4a3@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/03/2023 23:01, Guenter Roeck wrote:
> On Sun, Mar 12, 2023 at 02:12:51PM +0100, Krzysztof Kozlowski wrote:
>> The driver can match only via the DT table so the table should be always
>> used and the of_match_ptr does not have any sense (this also allows ACPI
>> matching via PRP0001, even though it might not be relevant here).
>>
>>   drivers/media/cec/i2c/ch7322.c:583:34: error: ‘ch7322_of_match’ defined but not used [-Werror=unused-const-variable=]
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
> FWIW: There is also
> https://patches.linaro.org/project/linux-media/patch/20230215214724.3798917-1-linux@roeck-us.net/

I superseded that patch in patchwork in favor of this patch since this is part of
a larger series.

Krzysztof, please let me know if you will take this series yourself or want me to
make a PR for it.

Regards,

	Hans

> 
> The lack of ACPI support is a real problem and very relevant.
> 
> Guenter
> 
>> ---
>>  drivers/media/cec/i2c/ch7322.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/cec/i2c/ch7322.c b/drivers/media/cec/i2c/ch7322.c
>> index 34fad7123704..3c6e6496a001 100644
>> --- a/drivers/media/cec/i2c/ch7322.c
>> +++ b/drivers/media/cec/i2c/ch7322.c
>> @@ -589,7 +589,7 @@ MODULE_DEVICE_TABLE(of, ch7322_of_match);
>>  static struct i2c_driver ch7322_i2c_driver = {
>>  	.driver = {
>>  		.name = "ch7322",
>> -		.of_match_table = of_match_ptr(ch7322_of_match),
>> +		.of_match_table = ch7322_of_match,
>>  	},
>>  	.probe_new	= ch7322_probe,
>>  	.remove		= ch7322_remove,

