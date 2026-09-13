Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B05E3C1969
	for <linux-sunxi@lists.linux.dev>; Sun, 13 Sep 2026 12:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789302829; cv=none; b=ngKdmq6REnzLd+lPmxdqtTADykfKUDaOeSNwOvlGVmw6uUtQOmPcgQUmhIiZk5p2b9lSEx116n/YLViyzjLgW5g+gA6hx+igYHSafN3VqqBcMEiOEO7NquIcT9L/iBDL7Eqgjr3sGk9LUSLhis5h2Yt7Zq/6JZefKh0Wi8woAI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789302829; c=relaxed/simple;
	bh=/BtZgDfys4CXTrsxFKjPXH5EalqVZkUvEMDQgav+eWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sjbGwT7pG0uJDL9n1MYXqeGk3fk/r58lHLdiUBvFtBXa+ojUL9An3fYdi11jIYsREWsFDsTm5tULs+26Cfb5LhTVIwy9ANSf1gRMi1RUAVz+cO9jW/RxZFzC+TJIloskZUJ55h0om29CmHG+/jQyBsrton77/tbcpsfRh9Og2Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vbtc5akr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D63g02UR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vbtc5akr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D63g02UR"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DAUQ88822244
	for <linux-sunxi@lists.linux.dev>; Sun, 13 Sep 2026 12:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cyF7bDkehBP
	xmMLQkDJqRH6FRo5LgFRknR9TH2lR+pw=; b=Vbtc5akrWG0zesD6IH5CV8IsjEy
	SB1MMzY1X3ZE8yz6bmi3++eMe8tCD7cR0XdsSCyfls0kEKP2Ssd3Rl2AzOhBuvQb
	36B/y3jB2hnYRvS7Yj1wacJrBbSCrvPsWG7U7Dq/ErXNK87Z8p7cpb34SJ9S9C6I
	FthnBYyA9heWHk4q3vR65jAENHTK1jyghNKCHZvd4YUVaqXJotT9rUE9FhKqzCu5
	EackylVKLzM+Ns2J8hzPC5UQq7p3lTeMoIydJb4yMHhIkinFe8hQU1icZAScMXxa
	CKpXnJk75cT2NPWtBFvKa0ukD5+e/3VgWW9xFwW+eAMdOlC6RJ5bug+HRvw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cb603-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Sun, 13 Sep 2026 12:33:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9394ad7f64aso392363885a.3
        for <linux-sunxi@lists.linux.dev>; Sun, 13 Sep 2026 05:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789302825; x=1789907625; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cyF7bDkehBPxmMLQkDJqRH6FRo5LgFRknR9TH2lR+pw=;
        b=D63g02URvvZqykgQqWjUDfkJYDZ0LkJffAULGYz1plTHPGPbDMxRA8Acb5yi8zG3a6
         6FkQBQS2/dQI8cN0euok2OEwMF3UNK4Qu8plk+9eo/auDa91ULbW15Bi5V0YFeAo36kY
         ufcnLLvptGqs8gqeobhI0IQvMuNXICgGIZWLwHm3H1u08TB+sa6yfN6g39vL0jADizb3
         2iC5TBnadl6xjXH3sQ7AfwTbD6Ws8YoO8fMknyzyhYOGTZgr1k4UwVJOVDcKbCnENPMP
         aOZ7IOM/kC7evPV6AIyMhjtMfTVSktBNyRgdZ9IGA8YruNd663jwqZloC5sHP3HN7NlH
         3qOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789302825; x=1789907625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cyF7bDkehBPxmMLQkDJqRH6FRo5LgFRknR9TH2lR+pw=;
        b=fKq1w+V1RklSGQtHSH5EjBrXgGrAMxo0LVrsNKEwsJ3I6YV20qUTWJ52VGeeRb69ZY
         OSZu3tCXdkNA06/Aj2mTocypFBeBJljpWb7dUR2KVLFlfWqVx/QVYwuYPQzA3bpOPUeU
         A8IJwHFGU2vjcB5Rh2B+pBoyN0Pi3DNrSiW/efp8N1hm/MaFj+oJJ+ooxAviY5lfTDnu
         fl1Jd9xBehhs9pawKEoqr1VKwGJyzgEM3RHG5jwtE7mMFIrnAw+ogGOxPjekdTHqxj+j
         MRwMkVxPbj5QGPyT5o7P01DY5H9B7yP3YlA2jF8fMDTNITvhqbTVNmI6peneVcf4m5cz
         cRUg==
X-Forwarded-Encrypted: i=1; AKwUvBxmAGYdhEk2SHcWL8vHAw+QBLWrsGWMmx/f74hqETLjWbcokBKIG5JKiiE9sjEkXz6YLY3bqEmigFclZA==@lists.linux.dev
X-Gm-Message-State: AFuF++lyDEB0TkNNG5SyWL4qPdYmvHTHiAAZoOtFsNoStF2Q76cKy1tp
	ZVfyLT6QM9nntNfBmk0geRgsdkqHbG8QYNyL6dRh/mFMJLiR1HnpyeBhdnRhJV/z/iIrSs/OZts
	Ap+jpKxiFTdBsEhjhEmEdbMislSIOUSVW6BvKHK4e3O+xdGrRCYK6DPnlEVV4FEPRPA==
X-Gm-Gg: AYBFou03EABI1b0XueUb+N+jj+BJK6nteP0W7p6LdDo5oayqNJLMtfQqVJRoodAXjwl
	Zg6baRsOBzT+KyqTcsHlSRnyOIpb8oFRVTIILhD2FKezvqmkIR12pAMi33cup3LC+2RsXbTNDkG
	a6RxW6sj8mXyr1oK768fhXkdbK2bsFjuvY3s0BhS4GEJRJmaejurIxoKkeNlcbjUpcVZo5l8Y59
	qBVP8gF2LuXnJi90QnJsXRK+qev+QYe9Rl6kpuRI9JW/YwQ7twCC+wLHOkwALAm1qQJpnbSuRc4
	VoujRm+RkWMGTfZFSphqS929+opshqAe87Hjs3cPVlXW4jQ0FMETZVaA2Mien2LLuEsAZpXEPyV
	R+/Ok4EdXucKVi2Q=
X-Received: by 2002:a05:620a:28c4:b0:939:518d:7f6e with SMTP id af79cd13be357-939ea137501mr1929954485a.22.1789302825022;
        Sun, 13 Sep 2026 05:33:45 -0700 (PDT)
X-Received: by 2002:a05:620a:28c4:b0:939:518d:7f6e with SMTP id af79cd13be357-939ea137501mr1929947785a.22.1789302824548;
        Sun, 13 Sep 2026 05:33:44 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e69f02c92sm131403175e9.2.2026.09.13.05.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 05:33:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Chen-Yu Tsai <wens@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Liu Ying <victor.liu@nxp.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Francesco Dolcini <francesco@dolcini.it>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Marcus Folkesson <marcus.folkesson@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Russell King <linux@armlinux.org.uk>, Simha BN <simhavcs@gmail.com>,
        CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Chris Morgan <macromorgan@hotmail.com>,
        Martinez Canillas <javierm@redhat.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] dt-bindings: display/msm: Use consistent indentation in the example
Date: Sun, 13 Sep 2026 14:33:33 +0200
Message-ID: <20260913123331.100293-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260913123331.100293-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260913123331.100293-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7238; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=/BtZgDfys4CXTrsxFKjPXH5EalqVZkUvEMDQgav+eWQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqppgcDRWoexqVysJxJwz/JPJdHx9ku3F8DoK6B
 yuVBP6zpQWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqaYHAAKCRDBN2bmhouD
 1y6aD/9f+MGyU72k6ORvj3aQN0S1PsG+bjGsEspokFkPaCBbS7zAdkPouE7QFYItzCwMvv/m0gK
 APZCXfYZlCP6eUi9UTspRlXiXU7NISQbua9ZXN+IXb2FDaWgd5zM3peWDhJhLu5bS2WcxQVr/8N
 I5RNPu5hf5M8d+T4dXFhU96eALQUqoa/wttTAc5WT54YQpIQ+aKgyXNOOD8mPvA4HF4htEU/7Ps
 Nrk6wjVJ/ANv+ndNEOC1D3doEBW/Jz0/FwUqWKF+TogLWFiOEcrhkzGknmjD7O2SL0OG1KlHh3g
 ex/1yYjQzZLn8NZ7xIUX6ylwGd7/+qlEapIsuyGpV1WX7WxoeW6VijBpZipCZZA7PYQ7O9s5Nla
 OmiDMjSxY6/bUkUFv46YkBBbuVJpUFrr5iDiKs6/eN1mgKcWf68ONIgxM8fm3GiilYyXAM1x3wU
 zkrhT2nOisbLArRqZBV/sSuUjwpaoFvg4xibMe6vw6Gbveh+2miJkAYP0bB54UjrJVW7Qdj8Y5j
 O93zxfjAFIAMdWW0pzpb0V6x5YsTtWwxKBZ+8MDixIqAiFQXp93HqTD868dPpffRwRiGPVipvNI
 E8lqXrt3TtAfO5Raa9OjgbQ1kaYXPxhIhpW76faosmFJa/588EqAE0KYH3pqqhgkCfBy0pvuGr/ 8Ur3MhMzzkfl7lg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 23XubLPbXPimiZfMPkPywJW0IrHEWzyj
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa6982a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=KDEBpenjW5rMv1hHu3kA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDE3OCBTYWx0ZWRfX40JUog5P2DWK
 tZVJQ5bt8n0GVXqKjM6X88Dq3wDcjyaPPoQVqGKd5TBAPBbOBIAWNFcJKM9W1/fKH0PW1Eja31/
 wkTl3sxesWOI/OT94WvCrFItFy9xk1s=
X-Proofpoint-ORIG-GUID: 23XubLPbXPimiZfMPkPywJW0IrHEWzyj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDE3OCBTYWx0ZWRfXwLpApXHHI9rl
 ClgM2l5JQTMMsSYndXpM2NmkXBajXgleU/vzZRfPuv08lRmhWf+6g1xlMAtBmcTsS06TfCt/qlP
 Ptgch0aspgf1r+7jMLwNVAz0KZrsiq1nrtslgUddMREwboppekIsnEPp5aBvuRoRdW3gRBaQYN9
 VtbNAal46oGr21hQduThZGk4rXzskGS1g8w2ckTDJgiYHFe+gkxVdK3HeujjNVp6Q546ofWHRuQ
 IqznkPWupxnV6HTKdhUdZouRUEU4KVqsdmQNOLEe5iUQBwNt/9JZDs+an9fR36TS4pttPpzyHPA
 uNouF4WNXn5xoiDYun40Xo7itCNQWiTV5Ni9pkrzvinWkW8UoddVsMD/JQFUg05jzcZns3bvnMI
 IQAr9b67IIEz/LjBFjuy/I2zNCz2RvA+myZTF5Asq/yZV4ogTGDxLtQ/QCGtAfX0dxLtBmjwNX6
 aDI7cWHLpwS79FD2/6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130178

Correct indentation in the examples to consistent 2- or 4-spaces
indentation to fix dt-check-style warnings ("example 0
[indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
re-indenting entire example just for that is too much churn.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../display/msm/qcom,qcs8300-mdss.yaml        |  6 +-
 .../display/msm/qcom,sar2130p-mdss.yaml       |  4 +-
 .../bindings/display/msm/qcom,sm6150-dpu.yaml | 14 ++---
 .../display/msm/qcom,sm8350-mdss.yaml         |  2 +-
 .../display/msm/qcom,x1e80100-mdss.yaml       | 60 +++++++++----------
 5 files changed, 43 insertions(+), 43 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
index c41a86203e78..287cce4dbddc 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
@@ -150,7 +150,7 @@ examples:
                     reg = <0>;
 
                     dpu_intf0_out: endpoint {
-                         remote-endpoint = <&mdss_dp0_in>;
+                        remote-endpoint = <&mdss_dp0_in>;
                     };
                 };
 
@@ -352,9 +352,9 @@ examples:
                 };
 
                 port@1 {
-                   reg = <1>;
+                    reg = <1>;
 
-                   mdss_dp_out: endpoint { };
+                    mdss_dp_out: endpoint { };
                 };
             };
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
index 44c1bb9e4109..fb3d24bbac7d 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
@@ -248,9 +248,9 @@ examples:
                         remote-endpoint = <&usb_dp_qmpphy_dp_in>;
                     };
                 };
-        };
+            };
 
-        dp_opp_table: opp-table {
+            dp_opp_table: opp-table {
                 compatible = "operating-points-v2";
 
                 opp-162000000 {
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-dpu.yaml
index b4f437172218..8cbf99f9fcba 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-dpu.yaml
@@ -81,7 +81,7 @@ examples:
             port@1 {
                 reg = <1>;
                 dpu_intf1_out: endpoint {
-                  remote-endpoint = <&mdss_dsi0_in>;
+                    remote-endpoint = <&mdss_dsi0_in>;
                 };
             };
         };
@@ -90,18 +90,18 @@ examples:
             compatible = "operating-points-v2";
 
             opp-19200000 {
-              opp-hz = /bits/ 64 <19200000>;
-              required-opps = <&rpmhpd_opp_low_svs>;
+                opp-hz = /bits/ 64 <19200000>;
+                required-opps = <&rpmhpd_opp_low_svs>;
             };
 
             opp-25600000 {
-              opp-hz = /bits/ 64 <25600000>;
-              required-opps = <&rpmhpd_opp_svs>;
+                opp-hz = /bits/ 64 <25600000>;
+                required-opps = <&rpmhpd_opp_svs>;
             };
 
             opp-307200000 {
-              opp-hz = /bits/ 64 <307200000>;
-              required-opps = <&rpmhpd_opp_nom>;
+                opp-hz = /bits/ 64 <307200000>;
+                required-opps = <&rpmhpd_opp_nom>;
             };
         };
     };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
index 68176de854b3..f5acf528d0e4 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
@@ -223,7 +223,7 @@ examples:
             phys = <&mdss_dsi0_phy>;
 
             ports {
-             #address-cells = <1>;
+                #address-cells = <1>;
                 #size-cells = <0>;
 
                 port@0 {
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
index 8d698a2e055a..8c65a80b46e4 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
@@ -208,47 +208,47 @@ examples:
             #sound-dai-cells = <0>;
 
             ports {
-              #address-cells = <1>;
-              #size-cells = <0>;
+                #address-cells = <1>;
+                #size-cells = <0>;
 
-              port@0 {
-                  reg = <0>;
+                port@0 {
+                    reg = <0>;
 
-                  mdss_dp0_in: endpoint {
-                    remote-endpoint = <&mdss_intf0_out>;
-                  };
-              };
+                    mdss_dp0_in: endpoint {
+                        remote-endpoint = <&mdss_intf0_out>;
+                    };
+                };
 
-              port@1 {
-                  reg = <1>;
+                port@1 {
+                    reg = <1>;
 
-                  mdss_dp0_out: endpoint {
-                  };
-              };
+                    mdss_dp0_out: endpoint {
+                    };
+                };
             };
 
             mdss_dp0_opp_table: opp-table {
-              compatible = "operating-points-v2";
+                compatible = "operating-points-v2";
 
-              opp-160000000 {
-                 opp-hz = /bits/ 64 <160000000>;
-                 required-opps = <&rpmhpd_opp_low_svs>;
-              };
+                opp-160000000 {
+                    opp-hz = /bits/ 64 <160000000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
+                };
 
-              opp-270000000 {
-                 opp-hz = /bits/ 64 <270000000>;
-                 required-opps = <&rpmhpd_opp_svs>;
-              };
+                opp-270000000 {
+                    opp-hz = /bits/ 64 <270000000>;
+                    required-opps = <&rpmhpd_opp_svs>;
+                };
 
-              opp-540000000 {
-                 opp-hz = /bits/ 64 <540000000>;
-                 required-opps = <&rpmhpd_opp_svs_l1>;
-              };
+                opp-540000000 {
+                    opp-hz = /bits/ 64 <540000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
 
-              opp-810000000 {
-                 opp-hz = /bits/ 64 <810000000>;
-                 required-opps = <&rpmhpd_opp_nom>;
-              };
+                opp-810000000 {
+                    opp-hz = /bits/ 64 <810000000>;
+                    required-opps = <&rpmhpd_opp_nom>;
+                };
             };
         };
     };
-- 
2.53.0

