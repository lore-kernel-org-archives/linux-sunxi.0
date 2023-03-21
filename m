Received: from pv50p00im-zteg10011501.me.com (pv50p00im-zteg10011501.me.com [17.58.6.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C385D2ED
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Mar 2023 16:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; t=1679417449;
	bh=5ukV6PY3ucC9hJDuXZfIVXvf88RafbDWPyWPmbI4b+M=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To;
	b=sgnlOBOdnJ4Md1bXyy0cTRU3QCOeruwaZC8HiYR65vzbQQ2ge3aX+tWCMisb4D/uf
	 I1wWmYnpJcFCcUh7ofpd7CoOCJyuzL1O1HLrBVaMu8L7aOQZ/gbdERcEitcLR4ujBR
	 FooPqSKK6iCNUA5uwLrF0m5JmtVzcgbyJw0OMdX3PjkZTGUo0ljQEsGUkcimcFquL9
	 DzzOFblcqbngGjpqVtiOwQnjHkUEOGOvd/DpN1EtHz03q85d8SKaoa0y8sMoi5/9UP
	 9mdLtyyboIOUOzqLQX8qA/cnU6IQCZfFe1Js3i1LM6Qk5rhB/JSk8njepVxy9Pi70b
	 NV8THQNzkH8OQ==
Received: from localhost (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-zteg10011501.me.com (Postfix) with ESMTPSA id BA8B54A00DE;
	Tue, 21 Mar 2023 16:50:45 +0000 (UTC)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Mar 2023 17:50:43 +0100
Message-Id: <CRC7SQGZJDK0.3FEG3RZR6IR5U@iMac.local>
Subject: Re: [PATCH] drm/sun4i: uncouple DSI dotclock divider from
 TCON0_DCLK_REG
From: "Roman Beranek" <romanberanek@icloud.com>
To: "Maxime Ripard" <maxime@cerno.tech>
Cc: "Chen-Yu Tsai" <wens@csie.org>, "David Airlie" <airlied@gmail.com>,
 "Daniel Vetter" <daniel@ffwll.ch>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Samuel Holland" <samuel@sholland.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.14.0
References: <20230320161636.24411-1-romanberanek@icloud.com>
 <20230321145646.w6kr7ddurfxpg5rt@houat>
In-Reply-To: <20230321145646.w6kr7ddurfxpg5rt@houat>
X-Proofpoint-GUID: nW3p3X6tTkVEQXdicLpHvySaM0EbhDEp
X-Proofpoint-ORIG-GUID: nW3p3X6tTkVEQXdicLpHvySaM0EbhDEp
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.517,18.0.883,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-06-21=5F08:2022-06-21=5F01,2022-06-21=5F08,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 malwarescore=0
 mlxscore=0 phishscore=0 clxscore=1011 bulkscore=0 suspectscore=0
 mlxlogscore=771 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2303210132

Hello Maxime,

On Tue Mar 21, 2023 at 3:56 PM CET, Maxime Ripard wrote:
>
> This is similar to
> https://lore.kernel.org/all/20230319160704.9858-2-frank@oltmanns.dev/
>
> What's the story there?

Yes, Frank Oltmanns wrote me recently in relation to a patch I wrote
~ 3 years ago that addressed the framerate issue, proposing to
collaborate on pushing it upstream, however as I've been keeping up
with my inbox rather sporadically these days, by the time I read his
message, Frank had already taken the initiative and sent the patch.
So that's how we've got to this slightly awkward situation with two
patches on the same subject arriving 1 day apart of each other.

The problem with the original patch was that it went around
sun4i_dotclock by feeding it a rate adjusted such that the pll-mipi rate
was set correctly. I couldn't quite figure out at the time of how big
a portion of the tcon logic does the sun4i_dotclock code need to be made
aware of.

>Also, how was it tested/confirmed?

By counting Vblank interrupts (GIC 118).

Roman
